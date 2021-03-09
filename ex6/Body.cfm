
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

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
							font-weight: 700 !important ;
						}
						blockquote, body, img, li, p, td {
							font-family: helvetica, arial, sans-serif !important ;
						}
					</style>
				</core:IfMso>
			</core:HeaderContent>
			<!--- Setup the dark mode color overrides. --->
			<core:DarkModeStyles>
				.html-entity-blockquote,
				.html-entity-h1,
				.html-entity-h2,
				.html-entity-h3,
				.html-entity-h4,
				.html-entity-h5,
				.html-entity-img,
				.html-entity-li,
				.html-entity-p,
				.html-entity-td,
				.html-entity-th {
					color: cyan ;
				}

				.html-entity-blockquote {
					border-left-color: ##666666 ;
				}

				.html-entity-a {
					color: #theme.dark.primary# ;
				}
			</core:DarkModeStyles>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:HtmlEntityTheme entity="table" class="e6-body">
				border: 1px solid ##ebecee ;
				border-width: 0px 1px 1px 1px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="e6-body-top-border">
				background-color: ##ff3366 ;
				font-size: 1px ;
				height: 2px ;
				line-height: 2px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="e6-body-content">
				padding: 45px 0px 30px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="e6-body-footer">
				background-color: ##f8f8fa ;
				border-top: 1px solid ##ebecee ;
				color: ##6c7689 ;
				font-size: 12px ;
				font-weight: 400 ;
				line-height: 17px ;
				padding: 20px 0px 20px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="a" class="e6-body-footer-link">
				color: ##276ee5 ;
			</core:HtmlEntityTheme>
			<!--- Setup responsive styles. --->
			<core:MaxWidthStyles>
				.e6-body {
					border-width: 0px 0px 0px 0px ;
					width: 100% ;
				}

				.e6-body-gutter {
					width: 20px ;
				}

				.e6-body-content {
					padding: 20px 0px 20px 0px ;
				}
			</core:MaxWidthStyles>
			<!--- Setup the dark mode color overrides. --->
			<core:DarkModeStyles>
				.e6-body {
					border-color: ##666666 ;
				}

				.e6-body-footer {
					background-color: ##333333 ;
					border-top-color: ##666666 ;
					color: ##cccccc ;
				}

				.e6-body-footer-link {
					color: ##ffffff ;
				}
			</core:DarkModeStyles>


			<html:table width="#theme.width#" align="center" class="e6-body">
			<html:tr>
				<html:td colspan="3" class="e6-body-top-border">
					<br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td width="60" class="e6-body-gutter">
					<!--- Left margin. ---><br />
				</html:td>
				<html:td class="e6-body-content">

					#thistag.generatedContent#

				</html:td>
				<html:td width="60" class="e6-body-gutter">
					<!--- Right margin. ---><br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td colspan="3" align="center" class="e6-body-footer">

					Questions?
					<html:a href="https://www.bennadel.com" decoration="false" class="e6-body-footer-link">I'm here to help.</html:a>

				</html:td>
			</html:tr>
			</html:table>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
