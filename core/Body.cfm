
<!--- Import custom tag libraries. --->
<cfimport prefix="html" taglib="./html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<cfmodule template="./HtmlEntityTheme.cfm" entity="td" class="email-body-content">
				padding: 30px 0px 30px 0px ;
			</cfmodule>
			<cfmodule template="./MaxWidthStyles.cfm">
				.email-body-wrapper {
					width: 100% ;
				}

				.email-body-gutter {
					width: 20px ;
				}

				.email-body-content {
					padding: 20px 0px 20px 0px ;
				}
			</cfmodule>

			<html:table width="#theme.width#" align="center" class="email-body-wrapper">
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

			<cfmodule template="./Margin.cfm" size="normal" />

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
