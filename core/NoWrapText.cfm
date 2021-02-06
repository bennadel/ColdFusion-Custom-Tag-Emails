<cfscript>

	switch ( thistag.executionMode ) {
		case "end":

			thistag.generatedContent = thistag.generatedContent
				.reReplace( "\s+", "&nbsp;", "all" )
			;

		break;
	}

</cfscript><cfexit method="exitTemplate" />
