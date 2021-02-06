<cfscript>

	// Define custom tag attributes.
	param name="attributes.runonce" type="boolean" default=false;

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	switch ( thistag.executionMode ) {
		case "end":

			if ( attributes.runonce ) {

				cacheKey = getCacheKey( thistag.generatedContent );

				if ( request.keyExists( cacheKey ) ) {

					exit method="exitTag";

				}

				request[ cacheKey ] = true;

			}

			getBaseTagData( "cf_email" )
				.headerStyleBlocks
				.append( thistag.generatedContent )
			;

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

		return( "$$HeaderStylesRunOnceCache:#hash( content )#" );

	}

</cfscript>
