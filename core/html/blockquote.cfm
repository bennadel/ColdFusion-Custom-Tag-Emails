
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margin" type="string" default="none normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="contentStyle">
				border-left: 4px solid ##cccccc ;
				font-style: italic ;
				padding: 5px 20px 5px 30px ;
			</core:Styles>

			<core:Margin size="#attributes.margin.listFirst( ' ' )#" />

			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style="#contentStyle#">
					#thistag.generatedContent#
				</td>
			</tr>
			</table>

			<core:Margin size="#attributes.margin.listLast( ' ' )#" />

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
