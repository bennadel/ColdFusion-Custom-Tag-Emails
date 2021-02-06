<cfscript>

	// Define custom tag attributes.
	param name="attributes.entityClass" type="string" default="";
	param name="attributes.entityName" type="string" default="";
	param name="attributes.entityStyle" type="string" default="";
	param name="attributes.variable" type="variableName";

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	switch ( thistag.executionMode ) {
		case "end":

			caller[ attributes.variable ] = compileProperties(
				thistag.generatedContent,
				attributes.entityName,
				attributes.entityClass,
				attributes.entityStyle
			);

			// This tag doesn't generate output - it only manipulates variables.
			thistag.generatedContent = "";

		break;
	}

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	/**
	* I serialize the given inline style properties, bringing the font-family and MSO
	* line-height rules to the top where they are less likely to break things.
	* 
	* @content I am the Style block being serialized.
	* @entityName I am the tag-name of the entity being styled.
	* @entityClass I am the class-name of the entity being styled.
	* @entityStyle I am the inline style of the entity being styled.
	*/
	public string function compileProperties(
		required string content,
		required string entityName,
		required string entityClass,
		required string entityStyle
		) {

		var blocks = gatherCascadingStyles( content, entityName, entityClass, entityStyle );
		var newline = chr( 10 );
		// CAUTION: I am using an ORDERED STRUCT here specifically to make sure that we
		// output the compiled properties in the same order that the developer provided
		// them. This will help us keep any funky hacks in place.
		var uniqueProperties = [:];
		var uniquePropertyLines = [];

		// The style blocks were aggregated in descending order from a precedence stand-
		// point. Which means, we can now iterate over the blocks in ascending order in
		// order to compile the unique list of CSS properties with proper overrides.
		for ( var block in blocks ) {

			var blockProps = splitBlock( block ).each(
				( line ) => {

					var parts = parseLine( line );

					if ( parts.name.len() && parts.value.len() ) {

						uniqueProperties[ parts.name ] = parts.value;

					}

				}
			);

		}

		// Now that we've compiled all the cascade of Tag DOM properties down into a set
		// of unique properties, let's generate the collection of unique key-value pairs.
		for ( var key in uniqueProperties ) {

			uniquePropertyLines.append( "#key#:#uniqueProperties[ key ]#;" );

		}

		// Now that we have compiled set of unique CSS property lines, let's sort them
		// so that we can fix some mail-client quirks.
		var results = uniquePropertyLines
			.sort(
				( a, b ) => {

					// CAUTION: The "font-family" property is likely to be the longest
					// and is mostly likely to be WRAPPED by the SMTP server due to
					// line-length restrictions. As such, let's always sort the "font-
					// family" to the front of the resultant STYLE attribute so that it
					// has the most possible breathing room.
					// --
					// NOTE: When the email is rendered, all STYLE attributes will be
					// placed on their own line, which should further help with wrapping
					// issues.
					if ( a.reFind( "^font-family" ) ) {

						return( -1 );

					} else if ( b.reFind( "^font-family" ) ) {

						return( 1 );

					}

					// CAUTION: For Outlook, the "mso-line-height-rule" is always
					// supposed to be defined before the "line-height" rule. As such,
					// let's bubble it up to the top (but after "font-family").
					if ( a.reFind( "^mso-line-height-rule" ) ) {

						return( -1 );

					} else if ( b.reFind( "^mso-line-height-rule" ) ) {

						return( 1 );

					}

					// If this is not a special case, leave the items in their original
					// sort order.
					return( 0 );

				}
			)
			.toList( " " )
		;

		return( results );

	}


	/**
	* I traverse the Custom Tag DOM (Document Object Model), gathering the styles
	* overrides and theming that has been put in place by other custom tags.
	* 
	* @entityName I am the tag-name of the entity being styled.
	* @entityClass I am the class-name of the entity being styled.
	* @entityStyle I am the inline style of the entity being styled.
	*/
	public array function gatherCascadingStyles(
		required string rootStyleBlock,
		required string entityName,
		required string entityClass,
		required string entityStyle
		) {

		var styleBlocks = [];

		// To gather the cascading styles for the current Style tag, we're going to walk
		// up the ColdFusion Custom Tag DOM. As we do this, we're going to PREPEND styles
		// to our running aggregate so that the higher-up styles have low-precedence when
		// it comes to runtime styling (meaning, higher-up styles can be overridden by
		// lower-down styles). That said, we only need to do this IF we have an entity
		// tag-name (as this is what defines the theme-variables).
		if ( entityName.len() ) {

			var classNames = splitClassNames( entityClass );
			var themeVariableName = "$$internal:styles:#entityName#";

			var adjustedIndex = 0;

			loop
				index = "local.i"
				value = "local.tagName"
				array = splitBaseTagList( getBaseTagList() )
				{

				adjustedIndex++;

				if (
					( tagName == "cfsavecontent" ) ||
					( tagName == "cfsilent" )
					) {

					adjustedIndex--;
					continue;

				}

				var parentTag = getBaseTagData( tagName, ( adjustedIndex - 1 ) );

				// Since we are walking UP the Tag DOM, we need to add styles in reverse
				// order of precedence. And, since "class name" styles are more specific
				// than "tag name" styles, we need to add them first.
				for ( var className in classNames ) {

					var themeClassVariableName = "#themeVariableName#.#className#";

					if ( entityClass.len() && parentTag.keyExists( themeClassVariableName ) ) {

						styleBlocks.prepend( parentTag[ themeClassVariableName ] );

					}

				}

				// After the class-based styles are added, check for tag-based styles.
				if ( parentTag.keyExists( themeVariableName ) ) {

					styleBlocks.prepend( parentTag[ themeVariableName ] );

				}

			}

		}

		// Since the root styles need to have the lowest precedent, add it to the front
		// of the style blocks.
	// styleBlocks.prepend( rootStyleBlock );
		styleBlocks.append( rootStyleBlock );

		// And, since the inline styles need to have the highest precedent, add it to the
		// end of the style blocks.
		if ( entityStyle.len() ) {

			styleBlocks.append( entityStyle );

		}

		return( styleBlocks );

	}


	/**
	* I parse the given CSS property line into a Name / Value pair.
	* 
	* @line I am the CSS property being parsed.
	*/
	public struct function parseLine( required string line )
		cachedWithin = "request"
		{

		var name = line.listFirst( ":" ).trim().lcase();
		var value = line.listRest( ":" )
			.trim()
			// Remove spaces around commas.
			.reReplace( "\s*,\s*", ",", "all" )
			// Normalize all spaces down to a single space.
			.reReplace( "\s+", " ", "all" )
		;

		return({
			name: name,
			value: value
		});

	}


	/**
	* I split the given base-tag list, returning the array of tag-names.
	* 
	* @tagList I am the list of tags-names being split.
	*/
	public array function splitBaseTagList( required string tagList )
		cachedWithin = "request"
		{

		return( tagList.listToArray() );

	}


	/**
	* I split the given style block into an array of CSS property lines.
	* 
	* @block I am the style block being split.
	*/
	public array function splitBlock( required string block )
		cachedWithin = "request"
		{

		return( block.listToArray( ";" ) );

	}


	/**
	* I take the given class value (which is a space-delimited list of classes) splits it
	* up and returns the array of class name tokens.
	* 
	* @value I am the class value being split.
	*/
	public array function splitClassNames( required string value )
		cachedWithin = "request"
		{

		return( value.reMatch( "\S+" ) );

	}

</cfscript>
