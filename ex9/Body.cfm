
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />
<cfimport prefix="ex9" taglib="./" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:HtmlEntityTheme entity="table" class="e9-body">
				border: 1px solid ##ebecee ;
				border-width: 0px 1px 1px 1px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="e9-body-top-border">
				background-color: ##ff3366 ;
				font-size: 1px ;
				height: 2px ;
				line-height: 2px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="e9-body-content">
				padding: 45px 0px 30px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="e9-body-footer">
				background-color: ##f8f8fa ;
				border-top: 1px solid ##ebecee ;
				color: ##6c7689 ;
				font-size: 12px ;
				font-weight: 400 ;
				line-height: 17px ;
				padding: 20px 0px 20px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="a" class="e9-body-footer-link">
				color: ##276ee5 ;
			</core:HtmlEntityTheme>
			<!--- Setup responsive styles. --->
			<core:MaxWidthStyles>
				.e9-body {
					border-width: 0px 0px 0px 0px ;
					width: 100% ;
				}

				.e9-body-gutter {
					width: 20px ;
				}

				.e9-body-content {
					padding: 20px 0px 20px 0px ;
				}
			</core:MaxWidthStyles>

			<ex9:ReplyAboveLine />

			<html:table width="#theme.width#" align="center" class="e9-body">
			<html:tr>
				<html:td colspan="3" class="e9-body-top-border">
					<br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td width="60" class="e9-body-gutter">
					<!--- Left margin. ---><br />
				</html:td>
				<html:td class="e9-body-content">

					#thistag.generatedContent#

				</html:td>
				<html:td width="60" class="e9-body-gutter">
					<!--- Right margin. ---><br />
				</html:td>
			</html:tr>
			<html:tr>
				<html:td colspan="3" align="center" class="e9-body-footer">

					Questions?
					<html:a href="https://support.invisionapp.com/hc/en-us" decoration="false" class="e9-body-footer-link">We're here to help.</html:a>

				</html:td>
			</html:tr>
			</html:table>

			<ex9:PoweredBy />

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
