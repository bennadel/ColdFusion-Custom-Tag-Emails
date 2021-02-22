<cfscript>

	// Define custom tag attributes.
	param name="attributes.class" type="string" default="";
	param name="attributes.entity" type="string";

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	switch ( thistag.executionMode ) {
		case "end":

			parentTag = getBaseTagData( getParentTagName( getBaseTagList() ) );

			loop
				value = "entityName"
				list = attributes.entity
				delimiters = ", "
				{

				themeVariableName = "$$entity:theme:#entityName#";

				if ( len( attributes.class ) ) {

					for ( className in splitClassNames( attributes.class ) ) {

						classVariableName = "#themeVariableName#.#className#";

						prefixContent = structKeyExists( parentTag, classVariableName )
							? ( ";" & parentTag[ classVariableName ] )
							: ""
						;

						parentTag[ classVariableName ] = ( prefixContent & thistag.generatedContent );

					}

				} else {

					prefixContent = structKeyExists( parentTag, themeVariableName )
						? ( ";" & parentTag[ themeVariableName ] )
						: ""
					;

					parentTag[ themeVariableName ] = ( prefixContent & thistag.generatedContent );

				}

			}

			// This tag doesn't generate output - it only manipulates variables.
			thistag.generatedContent = "";

		break;
	}

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	/**
	* I get the parent custom tag name from the given custom tag list.
	* 
	* @tagList I am the list of ColdFusion custom tag ancestors being parsed.
	*/
	public string function getParentTagName( required string tagList )
		cachedWithin = "request"
		{

		// The 1st tag is the current tag. We have to go above it.
		return( listGetAt( arguments.tagList, 2 ) );

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
