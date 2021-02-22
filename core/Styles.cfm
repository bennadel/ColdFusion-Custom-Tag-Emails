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
	* I clean up the font-family value, replacing double-quotes with single-quotes so
	* that we don't break the inline style attribute.
	* 
	* @value I am the font-family property value being cleaned.
	* 
	*/
	public string function cleanFontFamilyValue( required string value )
		cachedWithin = "request"
		{

		return( reReplace( arguments.value, """", "'", "all" ) );

	}


	/**
	* I serialize the given inline style properties, bringing the font-family and MSO
	* line-height rules to the top where they are less likely to break things.
	* 
	* @entityStyleBlock I am the Style block being serialized.
	* @entityName I am the tag-name of the entity being styled.
	* @entityClass I am the class-name of the entity being styled.
	* @entityStyle I am the inline style of the entity being styled.
	*/
	public string function compileProperties(
		required string entityStyleBlock,
		required string entityName,
		required string entityClass,
		required string entityStyle
		) {

		var blocks = variables.gatherCascadingStyles(
			arguments.entityStyleBlock,
			arguments.entityName,
			arguments.entityClass,
			arguments.entityStyle
		);
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

			structAppend( uniqueProperties, variables.parseBlock( block ) );

		}

		// Now that we've compiled all the cascade of Tag DOM properties down into a set
		// of unique properties, let's generate the collection of unique key-value pairs.
		// However, when we generate the inline Style attribute, we want to move several
		// of the propreties to the front of the list.
		// --
		// CAUTION: The "font-family" property is likely to be the longest and is mostly
		// likely to be WRAPPED by the SMTP server due to line-length restrictions. As
		// such, let's always sort the "font-family" to the front of the resultant STYLE
		// attribute so that it has the most possible breathing room.
		// --
		// NOTE: When the email is rendered, all STYLE attributes will be
		// placed on their own line, which should further help with wrapping
		// issues.
		// --
		// CAUTION: For Outlook, the "mso-line-height-rule" is always supposed to be
		// defined before the "line-height" rule. As such, let's bubble it up to the top
		// (but after "font-family").
		var fontFamilyLine = "";
		var msoLineHeightRule = "";

		for ( var key in uniqueProperties ) {

			if ( key == "font-family" ) {

				fontFamilyLine = "#key#:#variables.cleanFontFamilyValue( uniqueProperties[ key ] )#; ";

			} else if ( key == "mso-line-height-rule" ) {

				msoLineHeightRule = "#key#:#uniqueProperties[ key ]#; ";

			} else {

				arrayAppend( uniquePropertyLines, "#key#:#uniqueProperties[ key ]#;" );

			}

		}

		return(
			trim(
				fontFamilyLine &
				msoLineHeightRule &
				arrayToList( uniquePropertyLines, " " )
			)
		);

	}


	/**
	* I traverse the Custom Tag DOM (Document Object Model), gathering the styles
	* overrides and theming that has been put in place by other custom tags.
	* 
	* @entityStyleBlock I am the inline styles of the Style block for the entity.
	* @entityName I am the tag-name of the entity being styled.
	* @entityClass I am the class-name of the entity being styled.
	* @entityStyle I am the inline style of the entity being styled.
	*/
	public array function gatherCascadingStyles(
		required string entityStyleBlock,
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
		if ( len( arguments.entityName ) ) {

			var classNames = variables.splitClassNames( arguments.entityClass );
			var themeVariableName = "$$entity:theme:#arguments.entityName#";

			loop
				index = "local.i"
				value = "local.tagName"
				array = variables.splitBaseTagList( getBaseTagList() )
				{
				
				var parentTag = getBaseTagData( tagName, ( i - 1 ) );

				// Since we are walking UP the Tag DOM, we need to add styles in reverse
				// order of precedence. And, since "class name" styles are more specific
				// than "tag name" styles, we need to add them first.
				for ( var className in classNames ) {

					var themeClassVariableName = "#themeVariableName#.#className#";

					if ( len( arguments.entityClass ) && structKeyExists( parentTag, themeClassVariableName ) ) {

						arrayPrepend( styleBlocks, parentTag[ themeClassVariableName ] );

					}

				}

				// After the class-based styles are added, check for tag-based styles.
				if ( structKeyExists( parentTag, themeVariableName ) ) {

					arrayPrepend( styleBlocks, parentTag[ themeVariableName ] );

				}

			}

		}

		// The entity styles have the next-to-highest precedence, being overridden only
		// by the optional inline styles.
		arrayAppend( styleBlocks, arguments.entityStyleBlock );

		// The inline styles need to have the highest precedent, so they need to be added
		// to the end of the style blocks.
		if ( len( arguments.entityStyle ) ) {

			arrayAppend( styleBlocks, arguments.entityStyle );

		}

		return( styleBlocks );

	}


	/**
	* I parse the block of CSS properties into a struct of key-value pairs.
	* 
	* @block I am the CSS block being parsed.
	*/
	public struct function parseBlock( required string block )
		cachedWithin = "request"
		{

		var blockProperties = [:];

		for ( var line in variables.splitBlock( arguments.block ) ) {

			var parts = variables.parseLine( line );

			if ( parts.isValid ) {

				blockProperties[ parts.name ] = parts.value;

			}

		}

		return( blockProperties );

	}


	/**
	* I parse the given CSS property line into a Name / Value pair.
	* 
	* @line I am the CSS property being parsed.
	*/
	public struct function parseLine( required string line )
		cachedWithin = "request"
		{

		var name = lcase( trim( listFirst( arguments.line, ":" ) ) );
		var value = trim( listRest( arguments.line, ":" ) );

		// Remove spaces around commas.
		value = reReplace( value, "\s*,\s*", ",", "all" );
		// Normalize all spaces down to a single space.
		value = reReplace( value, "\s+", " ", "all" );

		return({
			name: name,
			value: value,
			isValid: ( len( name ) && len( value ) )
		});

	}


	/**
	* I split the given base-tag list, returning the array of tag-names.
	* 
	* @value I am the list of tags-names being split.
	*/
	public array function splitBaseTagList( required string value )
		cachedWithin = "request"
		{

		var tagNames = listToArray( arguments.value ).filter(
			( tagName ) => {

				// Some ColdFusion custom tags appear to be implemented as pseudo-custom
				// tags that don't actually expose any state. As such, we have to omit
				// these internal tags from the list otherwise our getBaseTagData() calls
				// will blow-up.
				return(
					( arguments.tagName != "cfmodule" ) &&
					( arguments.tagName != "cfsavecontent" ) &&
					( arguments.tagName != "cfsilent" ) &&
					( arguments.tagName != "cftimer" )
				);

			}
		);

		return( tagNames );

	}


	/**
	* I split the given style block into an array of CSS property lines.
	* 
	* @value I am the style block being split.
	*/
	public array function splitBlock( required string value )
		cachedWithin = "request"
		{

		return( listToArray( arguments.value, ";" ) );

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

		return( reMatch( "\S+", arguments.value ) );

	}

</cfscript>
