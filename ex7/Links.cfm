
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset slots = {
				left: "",
				right: ""
			} />

			<core:HtmlEntityTheme entity="a">
				color: ##ff3366 ;
			</core:HtmlEntityTheme>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:HtmlEntityTheme entity="td">
				white-space: nowrap ;
			</core:HtmlEntityTheme>

			<html:table width="100%">
			<html:tr>
				<html:td width="50%" align="center">
					#slots.left#
				</html:td>
				<html:td width="50%" align="center">
					#slots.right#
				</html:td>
			</html:tr>
			</html:table>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
