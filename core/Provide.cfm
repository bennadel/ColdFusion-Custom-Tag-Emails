<cfscript>

	// Define custom tag attributes.
	param name="attributes.name" type="string";
	param name="attributes.value" type="any";

	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //

	switch ( thistag.executionMode ) {
		case "start":

			getBaseTagData( "cf_email" ).providers[ attributes.name ] = attributes.value;

			// Make sure this tag has NO BODY.
			exit method = "exitTag";

		break;
	}

</cfscript>
