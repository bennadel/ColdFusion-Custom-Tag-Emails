
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
		<cfoutput>

			<cfscript>

				// WIP: I'm not really sure what theming looks like yet, from a variable
				// standpoint. Since I can apply HtmlEntityTheme tags, so I even need to
				// have variables anymore?
				theme = {
					// Color concepts have been borrowed from Material Design.
					// --
					// https://material.io/design/color/the-color-system.html#color-theme-creation
					light: {
						// Background colors.
						primary: "##3f51b5",
						secondary: "##ff3366",
						background: "##fefefe",
						surface: "##fefefe",
						error: "##b00020",

						// Foreground colors.
						onPrimary: "##ffffff",
						onSecondary: "##ffffff",
						onBackground: "##22252b",
						onSurface: "##22252b",
						onError: "##ffffff"
					},
					dark: {
						// Background colors.
						primary: "##3f51b5",
						secondary: "##ff3366",
						background: "##121212",
						surface: "##121212",
						error: "##cf6679",

						// Foreground colors.
						onPrimary: "##000000",
						onSecondary: "##000000",
						onBackground: "##ffffff",
						onSurface: "##ffffff",
						onError: "##000000"
					},
					importUrls: [],
					width: 600,
					enableDarkModeSupport: false
				};

				headerStyleBlocks = [];
				headerContentBlocks = [];
				preContentBlocks = [];

			</cfscript>

			<!---
				These are the DEFAULT THEMES for the HTML ENTITIES. These represent the
				root styles that will be applied to all entity instances within the
				email. But, these styles can be overridden at every layer of the Custom
				Tag DOM (Document Object Model).
			--->

			<!---
				First, setup the basic font properties. These are limited to color, font-
				size, font-family, and line-height.
				--
				CAUTION: For emails that load a custom font URL, Outlook will not be
				happy. As such, those emails should define a forceful fallback to web-
				safe fonts for MSO clients. Something like:

				<core:HeaderContent>
					<core:IfMso>
						<style type="text/css">
							h1, h2, h3, h4, h5, th {
								font-family: garamond, georgia, serif !important ;
							}
							blockquote, body, img, li, p, td {
								font-family: helvetica, arial, sans-serif !important ;
							}
						</style>
					</core:IfMso>
				</core:HeaderContent>
			--->
			<core:HtmlEntityTheme entity="h1, h2, h3, h4, h5, th">
				color: #theme.light.onSurface# ;
				font-family: garamond, georgia, serif ;
				font-weight: 800 ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h1">
				font-size: 32px ;
				line-height: 40px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h2">
				font-size: 28px ;
				line-height: 36px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h3">
				font-size: 24px ;
				line-height: 32px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h4">
				font-size: 20px ;
				line-height: 28px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h5, th">
				font-size: 18px ;
				line-height: 26px ;
			</core:HtmlEntityTheme>
			<!--- IMG being included for the ALT text if the image doesn't load. --->
			<core:HtmlEntityTheme entity="blockquote, img, li, p, td">
				color: #theme.light.onSurface# ;
				font-family: helvetica, arial, sans-serif ;
				font-size: 18px ;
				font-weight: 400 ;
				line-height: 25px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="a">
				color: #theme.light.primary# ;
			</core:HtmlEntityTheme>
			<!---
				While CODE is an inline tag, we need to include the font-size or some
				older Outlook clients will make the font-size really small.
			--->
			<core:HtmlEntityTheme entity="code, pre">
				font-family: consolas, monaco, monospace ;
				font-size: 18px ;
				line-height: 25px ;
			</core:HtmlEntityTheme>

			<!---
				Next, setup the resets. These are supposed to normalize the elements
				across all the clients, mostly removing margins and paddings.
			--->
			<core:HtmlEntityTheme entity="a">
				text-decoration: underline ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="blockquote, div, h1, h2, h3, h4, h5, hr, img, p, pre">
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
				padding: 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="blockquote, div, h1, h2, h3, h4, h5, hr, li, img, p, pre, td, th">
				mso-line-height-rule: exactly ; <!--- For Outlook. --->
			</core:HtmlEntityTheme>
			<!---
				In Outlook on Windows, having a line-height on a content container will
				cause images to be clipped according to the line-height. If you are going
				to include an image in a content container, you need to "reset" the line-
				height value for that container.
			--->
			<core:HtmlEntityTheme entity="blockquote, div, h1, h2, h3, h4, h5, li, p, td, th" class="html-entity-line-height-reset">
				line-height: unset ;
				mso-line-height-rule: at-least ; <!--- For Outlook. --->
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="ol, ul">
				Margin-bottom: 0 ; <!--- For Outlook. --->
				margin-bottom: 0px ;
				Margin-top: 0 ; <!--- For Outlook. --->
				margin-top: 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="li">
				Margin-bottom: 3px ; <!--- For Outlook. --->
				margin-bottom: 3px ;
				Margin-top: 3px ; <!--- For Outlook. --->
				margin-top: 3px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td, th">
				padding: 0px ;
			</core:HtmlEntityTheme>

			<!---
				Finally, setup whatever other entity-specific styles we need that weren't
				covered in the core styles and the resets.
			--->
			<core:HtmlEntityTheme entity="blockquote">
				border-left: 4px solid ##cccccc ;
				font-style: italic ;
				padding: 5px 20px 5px 30px ;
			</core:HtmlEntityTheme>
			<!--- I borrowed whatever MDN uses on their website for CODE styles. --->
			<core:HtmlEntityTheme entity="code">
				background-color: ##eeeeee ;
				border-radius: 2px 2px 2px 2px ;
				box-decoration-break: clone ;
					-webkit-box-decoration-break: clone ;
				padding: 0px 3px 0px 3px ;
			</core:HtmlEntityTheme>
			<!--- DIV: No base styles. --->
			<core:HtmlEntityTheme entity="em">
				font-style: italic ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="hr">
				border-top: 1px solid ##cccccc ;
				font-size: 1px ;
				line-height: 1px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="img">
				border: none ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="mark">
				background-color: yellow ;
				display: inline-block ;
				font-weight: 800 ;
				padding: 0px 4px 0px 4px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="pre">
				background-color: ##eeeeee ;
				border: 1px solid ##cccccc ;
				padding: 10px 13px 10px 13px ;
				tab-size: 4 ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="strike">
				text-decoration: line-through ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="strong">
				font-weight: 800 ; <!--- For Lotus Notes. --->
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="symbol">
				font-family: arial, sans-serif ;
				font-weight: 400 ;
			</core:HtmlEntityTheme>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="bodyStyle">
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

					<cfif theme.enableDarkModeSupport>
						<meta name="color-scheme" content="light dark" />
						<meta name="supported-color-schemes" content="light dark" />
					</cfif>

					<!--- We need to hide this from Windows Live Mail. --->
					<core:IfNotMso>
						<meta http-equiv="X-UA-Compatible" content="IE=edge" />
					</core:IfNotMso>

					<meta name="x-apple-disable-message-reformatting" />
					<meta name="format-detection" content="telephone=no, date=no, address=no, email=no, url=no" />

					<title>
						#encodeForHtml( attributes.subject )#
					</title>

					<cfif theme.enableDarkModeSupport>

						<style type="text/css">
							:root {
								color-scheme: light dark ;
								supported-color-schemes: light dark ;
							}
						</style>

					</cfif>

					<cfif arrayLen( theme.importUrls )>

						<!---
							Outlook can choke on external font loading. As such, we want
							to include our font @import for Non-MSO clients only. Then,
							for MSO clients, we want a Style block that is just the
							system fonts.
							--
							CAUTION: The fallback style block has to be in the email-
							specific Body since we won't know what default fonts to use.
						--->
						<core:IfNotMso>

							<cfloop value="importUrl" array="#theme.importUrls#">
								<style type="text/css">
									@import url( "#encodeForCss( importUrl )#" ) ;
								</style>
							</cfloop>

						</core:IfNotMso>					

					</cfif>

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

						<!--- Prevent Apple from highlighting / altering links. --->
						a[x-apple-data-detectors] {
							color: inherit !important ;
							font-size: inherit !important ;
							font-family: inherit !important ;
							font-weight: inherit !important ;
							line-height: inherit !important ;
							/* text-decoration: none !important ; */
						}

						<cfif arrayLen( headerStyleBlocks )>
							<cfset writeOutput( arrayToList( headerStyleBlocks, chr( 10 ) ) ) />
						</cfif>

					</style>

					<cfif arrayLen( headerContentBlocks )>
						#arrayToList( headerContentBlocks, chr( 10 ) )#
					</cfif>

					<!--- Needed for property image scaling in some Outlook versions. --->
					<core:IfMso gte="9">
						<noscript>
							<xml>
								<o:OfficeDocumentSettings>
								<o:AllowPNG/>
								<o:PixelsPerInch>96</o:PixelsPerInch>
								</o:OfficeDocumentSettings>
							</xml>
						</noscript>
					</core:IfMso>
				</head>
				<body class="email-body" style="#bodyStyle#">

					<core:InboxTeaser teaser="#attributes.teaser#" />

					<div
						role="article"
						lang="en"
						aria-roledescription="email"
						aria-label="#encodeForHtmlAttribute( attributes.subject )#"
						class="email-body-outer-wrapper"
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

		var minifiedContent = trim( arguments.content );
		// Normalizing line-breaks and spaces.
		minifiedContent = variables.reReplaceAll( minifiedContent, "(?m)^[ \t]+", "" );
		minifiedContent = variables.reReplaceAll( minifiedContent, "[\r\n]+", newline );
		// Wrap each STYLE attribute onto its own line in order to help prevent mid-
		// style text-wrapping applied by the more stringent email clients.
		minifiedContent = variables.reReplaceAll( minifiedContent, "(\bstyle="")", "#newline#$1" );

		// Now that we've removed all the superfluous whitespace, as the last step in our
		// minification, let's apply any PRE tag content (which is intended to contain
		// meaningful whitespace).
		variables.preContentBlocks.each(
			( preContent, i ) => {

				minifiedContent = variables.reReplaceAll(
					minifiedContent,
					"__PRE:#arguments.i#__",
					arguments.preContent,
					true
				);

			}
		);

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
		required string replacementText,
		boolean quoteReplacement = false
		) {

		if ( arguments.quoteReplacement ) {

			arguments.replacementText = createObject( "java", "java.util.regex.Matcher" )
				.quoteReplacement( arguments.replacementText )
			;

		}

		var result = javaCast( "string", arguments.input ).replaceAll(
			javaCast( "string", arguments.patternText ),
			javaCast( "string", arguments.replacementText )
		);

		return( result );

	}

</cfscript>
