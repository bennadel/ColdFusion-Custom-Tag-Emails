
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />
<cfimport prefix="customized" taglib="./" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />
			<cfset theme.importUrls.append( "https://fonts.googleapis.com/css?family=Poppins:100,200,300,500|Roboto:100,200,300,400,500,600,700" ) />

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
							font-weight: 800 !important ;
						}
						blockquote, body, img, li, p, td {
							font-family: helvetica, arial, sans-serif !important ;
						}
					</style>
				</core:IfMso>
			</core:HeaderContent>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfset tableClass = "c-#createUniqueId()#" />
			<cfset contentClass = "c-#createUniqueId()#" />
			<cfset gutterClass = "c-#createUniqueId()#" />

			<core:Styles variable="tableStyle">
				border: 1px solid ##ebecee ;
				border-width: 0px 1px 1px 1px ;
			</core:Styles>
			<core:Styles variable="topBorderStyle">
				font-size: 1px ;
				height: 2px ;
				line-height: 2px ;
			</core:Styles>
			<core:Styles variable="contentStyle">
				padding: 45px 0px 30px 0px ;
			</core:Styles>
			<core:Styles variable="footerStyle">
				border-top: 1px solid ##ebecee ;
				color: ##6c7689 ;
				font-size: 12px ;
				font-weight: 400 ;
				line-height: 17px ;
				padding: 20px 0px 20px 0px ;
			</core:Styles>
			<core:Styles variable="footerLinkStyle">
				color: ##276ee5 ;
			</core:Styles>
			<core:HeaderStyles>
				@media only screen and ( max-width: 650px ) {

					.#tableClass# {
						border-width: 0px 0px 0px 0px !important ;
						width: 100% !important ;
					}

					.#gutterClass# {
						width: 20px !important ;
					}

					.#contentClass# {
						padding: 20px 0px 20px 0px !important ;
					}

				}
			</core:HeaderStyles>

			<html:table width="#theme.width#" align="center" class="#tableClass#" style="#tableStyle#">
			<html:tr>
				<!--- NOTE: "bgcolor" is needed for Lotus Notes. --->
				<html:td colspan="3" bgcolor="##ff3366" style="#topBorderStyle#">
					<br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td width="60" class="#gutterClass#">
					<!--- Left margin. ---><br />
				</html:td>
				<html:td class="#contentClass#" style="#contentStyle#">

					#thistag.generatedContent#

				</html:td>
				<html:td width="60" class="#gutterClass#">
					<!--- Right margin. ---><br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td colspan="3" align="center" bgcolor="##f8f8fa" style="#footerStyle#">

					Questions?
					<html:a href="https://www.bennadel.com" decoration="false" style="#footerLinkStyle#">I'm here to help.</html:a>

				</html:td>
			</html:tr>
			</html:table>

			<customized:Footer />

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
