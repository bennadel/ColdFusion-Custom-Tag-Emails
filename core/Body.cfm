
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />
<cfimport prefix="html" taglib="./html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:HtmlEntityTheme entity="td" class="email-body-content">
				padding: 30px 0px 30px 0px ;
			</core:HtmlEntityTheme>
			<core:MaxWidthStyles>
				.email-body-wrapper {
					width: 100% ;
				}

				.email-body-gutter {
					width: 20px ;
				}

				.email-body-content {
					padding: 20px 0px 20px 0px ;
				}
			</core:MaxWidthStyles>

			<html:table width="#theme.width#" class="email-body-wrapper">
			<html:tr>
				<html:td width="30" class="email-body-gutter">
					<!--- Left margin. ---><br />
				</html:td>
				<html:td class="email-body-content">

					#thistag.generatedContent#

				</html:td>
				<html:td width="30" class="email-body-gutter">
					<!--- Right margin. ---><br />
				</html:td>
			</html:tr>
			</html:table>

			<core:Margin size="large" />

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
