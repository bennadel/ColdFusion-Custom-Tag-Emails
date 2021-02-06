
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

		<core:HtmlEntityTheme entity="a">
			color: red ;
			text-decoration: underline ;
		</core:HtmlEntityTheme>

		<cfscript>
			
			theme = {
				// Color concepts have been borrowed from Material Design.
				// --
				// https://material.io/design/color/the-color-system.html#color-theme-creation
				colors: {
					// Background colors.
					primary: "##ff3366",
					secondary: "##ff3366",
					background: "##fefefe",
					surface: "##fefefe",
					error: "##b00020",

					// Foreground colors.
					onPrimary: "##ffffff",
					onSecondary: "##ffffff",
					onBackground: "##22252b",
					onSurface: "##22252b",
					onError: "##ffffff",

					// Miscellaneous colors.
					link: "##ff3366"
				},
				importUrls: [],
				fonts: {
					body: {
						family: "Helvetica, Arial, sans-serif",
						size: "18px",
						weight: "400",
						lineHeight: "1.35"
					},
					h1: {
						family: "Helvetica, Arial, sans-serif",
						size: "32px",
						weight: "800",
						lineHeight: "1.35"
					},
					h2: {
						family: "Helvetica, Arial, sans-serif",
						size: "28px",
						weight: "800",
						lineHeight: "1.35"
					},
					h3: {
						family: "Helvetica, Arial, sans-serif",
						size: "24px",
						weight: "800",
						lineHeight: "1.35"
					},
					h4: {
						family: "Helvetica, Arial, sans-serif",
						size: "20px",
						weight: "800",
						lineHeight: "1.35"
					},
					h5: {
						family: "Helvetica, Arial, sans-serif",
						size: "18px",
						weight: "800",
						lineHeight: "1.35"
					}
				},
				width: 600
			};

			headerStyleBlocks = [];
			headerContentBlocks = [];

		</cfscript>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="bodyStyle">
				background-color: #theme.colors.background# ;
				color: #theme.colors.onBackground# ;
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
				padding: 0px ;
				width: 100% ;
			</core:Styles>
			<core:Styles variable="articleStyle">
				-ms-text-size-adjust: 100%;
				-webkit-text-size-adjust: 100% ;
			</core:Styles>

			<cfsavecontent variable="emailContent">

				<!--- Full HTML doctype and XML-namespace needed for some Outlook features. --->
				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html
					xmlns="https://www.w3.org/1999/xhtml"
					lang="en"
					xml:lang="en"
					xmlns:v="urn:schemas-microsoft-com:vml"
					xmlns:o="urn:schemas-microsoft-com:office:office">
				<html lang="en">
				<head>
					<meta charset="utf-8" />
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
					<meta name="viewport" content="width=device-width, initial-scale=1.0" />

					<!--- We need to hide this from Windows Live Mail. --->
					<!--[if !mso]><!-->
					<meta http-equiv="X-UA-Compatible" content="IE=edge" />
					<!--<![endif]-->

					<!--- https://www.litmus.com/blog/what-email-marketers-need-to-know-about-ios-11-and-the-new-iphones/ --->
					<meta name="x-apple-disable-message-reformatting" />
					<meta name="format-detection" content="telephone=no, date=no, address=no, email=no, url=no" />

					<title>
						#encodeForHtml( attributes.subject )#
					</title>

					<!---
						Outlook can choke on external font loading. As such, we want to
						include our font @import for Non-MSO clients only. Then, for MSO
						clients, we want a Style block that is just the system fonts.
					--->
					<cfif theme.importUrls.len()>

						<!--[if !mso]><!-->
						<cfloop value="local.importUrl" array="#theme.importUrls#">

							<style type="text/css">
								@import url( "#encodeForCss( theme.fonts.importUrl )#" ) ;
							</style>

						</cfloop>
						<!--<![endif]-->

					</cfif>
					<!--[if mso]>
					<style type="text/css">
						body, table, td, a, h1, h2, h3, h4, h5, p {
							font-family: Helvetica, Arial, sans-serif !important ;
						}
						div { Margin: 0 ; margin: 0 !important ; }
					</style>
					<![endif]-->

					<!---
						CAUTION: Header style tags are not supported in all email
						clients.The following block represents progressive enhancement
						in the email clients that acknowledge it.
					--->
					<style type="text/css">

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
						table {
							border-collapse: collapse !important ;
						}

						<!---
							Use a better rendering method when resizing images in
							Outlook IE.
						--->
						img {
							-ms-interpolation-mode: bicubic ;
						}

						<!---
							Prevent Windows 10 Mail from underlining links. Styles for
							underlined links should be inline.
						--->
						a {
							text-decoration: none ;
						}

						##outlook a {
							padding: 0 ;
						}

						<!---
							When we switch to full-width images, make sure that the
							height will resize appropriately.
						--->
						@media only screen and ( max-width: #theme.width#px ) {
							img {
								height: auto !important ;
							}
						}

						<!--- Prevent Apple from highlighting / altering links. --->
						a[x-apple-data-detectors] {
							color: inherit !important ;
							font-size: inherit !important ;
							font-family: inherit !important ;
							font-weight: inherit !important ;
							line-height: inherit !important ;
							/* text-decoration: none !important ; */
						}

						<cfif headerStyleBlocks.len()>
							<cfset writeOutput( headerStyleBlocks.toList( chr( 10 ) ) ) />
						</cfif>

					</style>

					<cfif headerContentBlocks.len()>
						#headerContentBlocks.toList( chr( 10 ) )#
					</cfif>

					<!--- Needed for property image scaling in some Outlook versions. --->
					<!--[if gte mso 9]>
					<noscript>
						<xml>
							<o:OfficeDocumentSettings>
							<o:AllowPNG/>
							<o:PixelsPerInch>96</o:PixelsPerInch>
							</o:OfficeDocumentSettings>
						</xml>
					</noscript>
					<![endif]-->
				</head>
				<body class="email-body" style="#bodyStyle#">

					<core:InboxTeaser teaser="#attributes.teaser#" />

					<div
						role="article"
						lang="en"
						aria-roledescription="email"
						aria-label="#encodeForHtmlAttribute( attributes.subject )#"
						class="email-body-article"
						style="#articleStyle#">

						#thistag.generatedContent#

					</div>

				</body>
				</html>

			</cfsavecontent>

			<!---
				We want to remove as much whitespace from the generated content as
				possible so that we reduce the amount of data that is "split" across
				line-breaks by the email client. This also attempts to put every STYLE
				attribute on its own line to reduce the chances that a style attribute
				is split across lines.
			--->
			<cfset thistag.generatedContent = minifyEmailContent( emailContent ) />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I strip out as much white-space in the given content as possible.
	* 
	* @content I am the email body content being minified.
	*/
	public string function minifyEmailContent( required string content ) {

		var newline = chr( 10 );

		var minifiedContent = content.trim();
		// Normalizing line-breaks and spaces.
		minifiedContent = reReplaceAll( minifiedContent, "(?m)^[ \t]+", "" );
		minifiedContent = reReplaceAll( minifiedContent, "[\r\n]+", newline );
		// Wrap each STYLE attribute onto its own line in order to help prevent mid-
		// style text-wrapping applied by the more stringent email clients.
		minifiedContent = reReplaceAll( minifiedContent, "(\bstyle=""[^""]+""(?: |>))", "#newline#$1" );

		return( minifiedContent );

	}


	/**
	* I use Java RegEx patterns to replace all of the occurrences of the given pattern
	* with the given replacement.
	* 
	* NOTE: I am using this as a performance improvement over reReplace().
	* 
	* @input I am the content being inspected.
	* @patternText I am the RegEx pattern being matched.
	* @replacementText I am the replacement text for the matched pattern.
	*/
	public string function reReplaceAll(
		required string input,
		required string patternText,
		required string replacementText
		) {

		var result = javaCast( "string", input ).replaceAll(
			javaCast( "string", patternText ),
			javaCast( "string", replacementText )
		);

		return( result );

	}

</cfscript>
