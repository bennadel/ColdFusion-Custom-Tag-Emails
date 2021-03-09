
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Custom fonts and weights"
	teaser="Falling back with managed expectations">

	<!---
		We're going to load a custom font for this email. Note that if we load this font,
		we have a large variety in FONT-WEIGHT options. However, if our font fails to
		load (or is not supported in a given email client), we will NOT have all of these
		font-weight options at our disposal.
		--
		CAUTION: ImportURLs are only applied in a NON-MSO context (login within the root
		cf_email ColdFusion custom tag).
	--->
	<cfset theme = getBaseTagData( "cf_email" ).theme />
	<cfset theme.importUrls.append( "https://fonts.googleapis.com/css?family=Poppins:500|Roboto:100,200,300,400,500,600,700" ) />

	<!--- Update the base fonts for the custom font-family import. --->
	<core:HtmlEntityTheme entity="h1, h2, h3, h4, h5, th">
		font-family: Poppins, BlinkMacSystemFont, helvetica, arial, sans-serif ;
		font-weight: 500 ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="blockquote, img, li, p, td">
		font-family: Roboto, BlinkMacSystemFont, helvetica, arial, sans-serif ;
		font-weight: 300 ;
	</core:HtmlEntityTheme>

	<!--- Define some STRONG tag themes for our copy font variations. --->
	<core:HtmlEntityTheme entity="strong">
		font-weight: 700 ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="strong" class="semi-bold">
		font-weight: 400 ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="strong" class="bold">
		font-weight: 500 ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="strong" class="extra-bold">
		font-weight: 600 ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="strong" class="heavy">
		font-weight: 700 ;
	</core:HtmlEntityTheme>

	<!---
		Since MSO clients (Outlook on WINDOWS primarily) won't load remote fonts at all,
		we have to define a solid fallback font-family and font-weight.
		--
		CAUTION: The STRONG tag font-weight is hard to override.
	--->
	<core:HeaderContent>
		<core:IfMso>
			<style type="text/css">
				h1, h2, h3, h4, h5, th {
					font-family: helvetica, arial, sans-serif !important ;
					font-weight: 700 !important ;
				}
				blockquote, body, img, li, p, td {
					font-family: helvetica, arial, sans-serif !important ;
					font-weight: 400 !important ;
				}
				strong,
				strong.bold,
				strong.extra-bold,
				strong.heavy {
					font-weight: 700 !important ;
				}
				strong.semi-bold {
					font-weight: 400 !important ;
				}
			</style>
		</core:IfMso>
	</core:HeaderContent>

	<core:Body>
		<cfoutput>

			<html:h1>
				Custom fonts and weights
			</html:h1>

			<core:IfMso>
				<html:p style="color: red ;">
					<html:symbol>&##9888;</html:symbol>
					Email is being processed as an <html:strong>MSO client</html:strong>.
					<html:symbol>&##9888;</html:symbol>
				</html:p>
			</core:IfMso>

			<html:p>
				Let's try to use the class-name-based font-weights:
			</html:p>

			<html:ul>
				<html:li>
					<html:strong class="semi-bold">
						STRONG: semi-bold
					</html:strong>
				</html:li>
				<html:li>
					<html:strong class="bold">
						STRONG: bold
					</html:strong>
				</html:li>
				<html:li>
					<html:strong class="extra-bold">
						STRONG: extra-bold
					</html:strong>
				</html:li>
				<html:li>
					<html:strong class="heavy">
						STRONG: heavy
					</html:strong>
				</html:li>
				<html:li>
					<html:strong>
						STRONG: Default setting (no class-name)
					</html:strong>
				</html:li>
			</html:ul>

			<html:hr />

			<html:p>
				Let's look at font-weight applied to normal text:
			</html:p>

			<html:ul>
				<cfloop value="weight" list="100,200,300,400,500,600,700">
					<html:li>
						<html:span style="font-weight: #weight# ;">
							SPAN: Font weight #weight#
						</html:span>
					</html:li>
				</cfloop>
			</html:ul>

			<html:p>
				Let's look at font-weight applied to strong text:
			</html:p>

			<html:ul>
				<cfloop value="weight" list="100,200,300,400,500,600,700">
					<html:li>
						<html:strong style="font-weight: #weight# ;">
							STRONG: Font weight #weight#
						</html:strong>
					</html:li>
				</cfloop>
			</html:ul>

		</cfoutput>
	</core:Body>
</core:Email>
