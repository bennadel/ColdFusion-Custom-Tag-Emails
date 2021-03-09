
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfoutput>

	<cfset theme = getBaseTagData( "cf_email" ).theme />
	<cfset theme.importUrls.append( "https://fonts.googleapis.com/css?family=Poppins:100,200,300,500|Roboto:100,200,300,400,500,600,700" ) />
	<cfset theme.light.primary = "##ff3366" />

	<!--- Update the base fonts for the custom font-family import. --->
	<core:HtmlEntityTheme entity="h1, h2, h3, h4, h5, th">
		font-family: Poppins, BlinkMacSystemFont, helvetica, arial, sans-serif ;
		font-weight: 500 ; <!--- Highest that Poppins goes. --->
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="blockquote, img, li, p, td">
		font-family: Roboto, BlinkMacSystemFont, helvetica, arial, sans-serif ;
	</core:HtmlEntityTheme>
	<!---
		Since MSO / Outlook clients won't load remote fonts, we have to define a
		solid fallback font family and weight.
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
				}
			</style>
		</core:IfMso>
	</core:HeaderContent>
	<!--- Setup additional styles, not relating to font-family. --->
	<core:HtmlEntityTheme entity="a">
		color: #theme.light.primary# ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="p" class="cta-reply-option">
		font-size: 14px ;
		line-height: 19px ;
		text-align: center ;
	</core:HtmlEntityTheme>
	<core:HtmlEntityTheme entity="span" class="cta-reply-option-arrow">
		color: #theme.light.primary# ;
	</core:HtmlEntityTheme>

</cfoutput>
