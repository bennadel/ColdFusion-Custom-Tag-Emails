
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="style">
				background-color: yellow ;
				display: inline-block ;
				font-weight: bold ;
				padding: 0px 4px 0px 4px ;
			</core:Styles>

			<mark style="#style#">#thistag.generatedContent#</mark>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
