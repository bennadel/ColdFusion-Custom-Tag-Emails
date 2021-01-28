
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.subject" type="string" default="" />
<cfparam name="attributes.teaser" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfset coreColor = "##22252b" />
		<cfset coreTitleFont = "'Inv Eina 03', 'Eina 03', -apple-system, BlinkMacSystemFont, San Francisco, 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif" />
		<cfset coreCopyFont = "Roboto, RobotoDraft, Helvetica, Arial, sans-serif" />
		<cfset responsiveStyleBlocks = [] />

	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfsavecontent variable="emailContent">
			
				<!doctype html>
				<html lang="en">
				<head>
					<meta charset="utf-8" />
					<title>
						#encodeForHtml( attributes.subject )#
					</title>

					<style type="text/css">

						body,
						td {
							color: #coreColor# ;
							font-family: #coreCopyFont# ;
						}

						h1, h2, h3, h4, h5 {
							font-family: #coreTitleFont# ;
						}

						<cfif responsiveStyleBlocks.len()>
							<cfset writeOutput( responsiveStyleBlocks.toList( chr( 10 ) ) ) />
						</cfif>
					</style>

				</head>
				<body>

					<core:InboxTeaser teaser="#attributes.teaser#" />

					#thistag.generatedContent#

				</body>
				</html>

			</cfsavecontent>

			<cfset thistag.generatedContent = emailContent
				.reReplace( "(?m)^[ \t]+", "", "all" )
				.reReplace( "[\r\n]+", chr( 10 ), "all" )
			/>

		</cfoutput>
	</cfcase>
</cfswitch>
