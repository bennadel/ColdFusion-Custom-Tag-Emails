
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />
<cfimport prefix="ex12" taglib="./" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset email = getBaseTagData( "cf_email" ) />
			<!---
				In order to access the defined providers, I just have to reach up into
				the base "email" tag and grab the Providers struct. The same way I do
				for the theme data.
			--->
			<cfset theme = email.theme />
			<cfset providers = email.providers />

			<core:HtmlEntityTheme entity="table" class="ex12-body">
				border: 1px solid ##ebecee ;
				border-width: 0px 1px 1px 1px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="ex12-body-top-border">
				background-color: ##ff3366 ;
				font-size: 1px ;
				height: 2px ;
				line-height: 2px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="ex12-body-content">
				padding: 45px 0px 30px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="ex12-body-footer">
				background-color: ##f8f8fa ;
				border-top: 1px solid ##ebecee ;
				color: ##6c7689 ;
				font-size: 12px ;
				font-weight: 400 ;
				line-height: 17px ;
				padding: 20px 0px 20px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="a" class="ex12-body-footer-link">
				color: ##276ee5 ;
			</core:HtmlEntityTheme>
			<!--- Setup responsive styles. --->
			<core:MaxWidthStyles>
				.ex12-body {
					width: 100% ;
				}

				.ex12-body-gutter {
					width: 20px ;
				}

				.ex12-body-content {
					padding: 20px 0px 20px 0px ;
				}
			</core:MaxWidthStyles>

			<html:table width="#theme.width#" align="center" class="ex12-body">
			<html:tr>
				<html:td colspan="3" class="ex12-body-top-border">
					<br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td width="60" class="ex12-body-gutter">
					<br />
				</html:td>
				<html:td class="ex12-body-content">

					#thistag.generatedContent#

				</html:td>
				<html:td width="60" class="ex12-body-gutter">
					<br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td colspan="3" align="center" class="ex12-body-footer">

					Questions?
					<html:a href="#providers.siteUrl#">I'm here to help.</html:a>

				</html:td>
			</html:tr>
			</html:table>

			<ex12:FooterLinks />

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
