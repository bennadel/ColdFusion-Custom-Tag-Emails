
<!--- Define custom tag attributes. --->
<cfparam name="attributes.variable" type="variableName" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">

		<cfset caller[ attributes.variable ] = serializeProperties( thistag.generatedContent ) />

		<!--- This tag doesn't generate output - it only manipulates variable. --->
		<cfset thistag.generatedContent = "" />

	</cfcase>
</cfswitch>

<cfscript>
	
	public string function serializeProperties( required string content ) {

		var newline = chr( 10 );

		var style = content
			.reReplace( "(?m)^[ \t]+", "", "all" )
			.reReplace( "\r\n?|\n", newline, "all" )
			.listToArray( newline )
			.sort(
				( a, b ) => {

					// CAUTION: The "font-family" property is likely to be the longest
					// and is mostly likely to be WRAPPED by the SMTP server due to
					// line-length restrictions. As such, let's always sort the "font-
					// family" to the front of the resultant STYLE attribute so it has
					// the most possible breathing room.
					// --
					// NOTE: When the email is rendered, all STYLE attributes will be
					// placed on their own line, which should further help with wrapping
					// issues.
					if ( a.reFindNoCase( "^font-family" ) ) {

						return( -1 );

					} else if ( b.reFindNoCase( "^font-family" ) ) {

						return( 1 );

					}

					// CAUTION: For Outlook, the "mso-line-height-rule" is always
					// supposed to be defined before the "line-height" rule. As such,
					// let's bubble it up to the top (but after "font-family").
					if ( a.reFindNoCase( "^mso-line-height-rule" ) ) {

						return( -1 );

					} else if ( b.reFindNoCase( "^mso-line-height-rule" ) ) {

						return( 1 );

					}

					return( 0 );

				}
			)
			.toList( newline )
			.reReplace( "\s*;\s*", "; ", "all" )
			.reReplace( "\s*:\s*", ":", "all" )
			.reReplace( "\s*,\s*", ",", "all" )
			.reReplace( "\s+", " ", "all" )
			.trim()
		;

		return( style );

	}
	
</cfscript>
