<cfscript>

	switch ( thistag.executionMode ) {
		case "end":

			thistag.generatedContent = reReplace( thistag.generatedContent, "\s+", "&nbsp;", "all" );

		break;
	}

</cfscript><cfexit method="exitTemplate" />
