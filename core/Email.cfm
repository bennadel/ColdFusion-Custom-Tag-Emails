
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />
<cfimport prefix="html" taglib="./html/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.subject" type="string" default="" />
<cfparam name="attributes.teaser" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfset coreBackgroundColor = "##fefefe" />
		<cfset coreColor = "##22252b" />
		<cfset coreFontSize = "18px" />
		<cfset coreFontWeight = "400" />
		<cfset coreTitleFont = "Poppins, BlinkMacSystemFont, Helvetica, Arial, sans-serif" />
		<cfset coreTitleFontWeight = "500" />
		<cfset coreCopyFont = "Roboto, BlinkMacSystemFont, Helvetica, Arial, sans-serif" />
		<cfset coreLinkColor = "##ff3366" />
		<cfset responsiveStyleBlocks = [] />

	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfsavecontent variable="emailContent">
			
				<!doctype html>
				<html lang="en">
				<head>
					<meta charset="utf-8" />
					<meta name="viewport" content="width=device-width, initial-scale=1.0" />

					<!--- https://www.litmus.com/blog/what-email-marketers-need-to-know-about-ios-11-and-the-new-iphones/ --->
					<meta name="x-apple-disable-message-reformatting" />

					<title>
						#encodeForHtml( attributes.subject )#
					</title>

					<!---
						CAUTION: Header style tags are not supported in all email
						clients.The following block represnts progressive enhancement
						in the email clients that ackwnoledge it.
					--->
					<style type="text/css">

						@import url( "https://fonts.googleapis.com/css?family=Poppins:100,200,300,500|Roboto:100,200,300,400,500,600,700" ) ;

						html,
						body {
							height: 100% !important ;
							margin: 0 auto !important ;
							padding: 0 auto !important ;
							width: 100% !important ;
						}

						<!--- Stop Outlook resizing small text. --->
						* {
							-ms-text-size-adjust: 100% ;
							-webkit-text-size-adjust: 100% ;	
						}

						<!--- Stop Outlook from adding extra spacing to tables. --->
						table, td {
							mso-table-lspace: 0pt !important ;
							mso-table-rspace: 0pt !important ;
						}

						<!--- Use a better rendering method when resizing images in Outlook IE. --->
						img {
							-ms-interpolation-mode: bicubic ;
						}

						<!---
							Prevent Windows 10 Mail from underlining links. Styles for
							underlined links should be inline. --->
						a {
							text-decoration: none ;
						}

						@media only screen and ( max-width: 600px ) {
							img {
								height: auto !important ;
							}
						}

						<cfif responsiveStyleBlocks.len()>
							<cfset writeOutput( responsiveStyleBlocks.toList( chr( 10 ) ) ) />
						</cfif>

					</style>

					<!--- This is for Outlook. --->
					<!--[if mso]>
					<style type="text/css">
						body, table, td, a, h2, h3, h4, h5, p {
							font-family: Arial, Helvetica, sans-serif !important ;
						}
					</style>
					<![endif]-->
				</head>
				<html:body>

					<core:InboxTeaser teaser="#attributes.teaser#" />

					#thistag.generatedContent#

				</html:body>
				</html>

			</cfsavecontent>

			<!---
				We want to remove as much whitespace from the generated content as
				possible so that we reduce the amount of data that is "split" across
				line-breaks by the email client. This also attempts to put every STYLE
				attribute on its own line to reduce the chances that a style attribute
				is split across lines.
			--->
			<cfset thistag.generatedContent = emailContent
				.reReplace( "(?m)^[ \t]+", "", "all" )
				.reReplace( "[\r\n]+", chr( 10 ), "all" )
				.reReplace( "(\bstyle=""[^""]+""(?: |>))", "#chr( 10 )#\1#chr( 10 )#", "all" )
			/>

		</cfoutput>
	</cfcase>
</cfswitch>
