<cfscript>

	// Define custom tag attributes.
	param name="attributes.runonce" type="boolean" default=true;

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	switch ( thistag.executionMode ) {
		case "end":

			if ( attributes.runonce ) {

				cacheKey = getCacheKey( thistag.generatedContent );

				if ( structKeyExists( request, cacheKey ) ) {

					thistag.generatedContent = "";
					exit method="exitTag";

				}

				request[ cacheKey ] = true;

			}

			arrayAppend( getBaseTagData( "cf_email" ).headerContentBlocks, thistag.generatedContent );

			// This tag doesn't generate output - it only manipulates variables.
			thistag.generatedContent = "";

		break;
	}

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	/**
	* I return the cache key for the given tag content.
	* 
	* @content I am the tag content being inspected.
	*/
	public string function getCacheKey( required string content )
		cachedWithin = "request"
		{

		return( "$$HeaderContentRunOnceCache:#hash( arguments.content )#" );

	}

</cfscript>
