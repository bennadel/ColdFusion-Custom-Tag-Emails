
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

	<!---
		CONNUDRUM: At this point, the font-weight of "400" may be semi-bold if you have
		the custom font; or, it may be "normal" if you don't have the custom font. As
		such, we have to come up with a way in which we can use semi-bold that safely
		falls-back to either using "normal" or "bold", depending on our preference. To
		manage this with better expectations, font-weight should always be handled as a
		separate setting. This way, we can define font-weight overrides for MSO clients.
		--
		NOTE: These are specific to the "Roboto" custom font weight-range.
	--->
	<core:HtmlEntityTheme entity="strong" class="semi-bold">
		font-weight: 400 ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="strong" class="bold">
		font-weight: 500 ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="strong" class="extra-bold">
		font-weight: 600 ;
	</core:HtmlEntityTheme>

	<!---
		Since MSO / Outlook clients (IBM Notes and Outlook on WINDOWS) won't load remote
		fonts, we have to define a solid fallback font-family and font-weight.
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
				strong {
					font-weight: 700 !important ;
				}

				span {
					font-family: courier, serif !important ;
					color: red !important ;
				}
			</style>
		</core:IfMso>
	</core:HeaderContent>

	<core:Body>
		<cfoutput>

			<html:h1>
				Custom fonts and weights
			</html:h1>

			<html:p>
				Let's look at <span>font-weight applied to normal text</span>:
			</html:p>

			<html:ul>
				<cfloop value="weight" list="100,200,300,400,500,600,700">
					<html:li>
						<html:span style="font-weight: #weight# ;">
							Span: Font weight #weight#
						</html:span>
					</html:li>
				</cfloop>
			</html:ul>

			<html:p>
				Let's look at font-weight applied to bold text:
			</html:p>

			<html:ul>
				<cfloop value="weight" list="100,200,300,400,500,600,700">
					<html:li>
						<html:strong style="font-weight: #weight# ;">
							Strong: Font weight #weight#
						</html:strong>
					</html:li>
				</cfloop>
			</html:ul>

			<html:p>
				Let's try to use the class-name-based font-weights:
			</html:p>

			<html:ul>
				<html:li>
					<html:strong>
						Strong: Default setting
					</html:strong>
				</html:li>
				<html:li>
					<html:strong class="semi-bold">
						Strong: semi-bold
					</html:strong>
				</html:li>
				<html:li>
					<html:strong class="bold">
						Strong: bold
					</html:strong>
				</html:li>
				<html:li>
					<html:strong class="extra-bold">
						Strong: extra-bold
					</html:strong>
				</html:li>
			</html:ul>

			<core:IfMso>
				<html:p>
					This is being processed as an <html:strong>MSO client</html:strong>.
				</html:p>
			</core:IfMso>

		</cfoutput>
	</core:Body>
</core:Email>
