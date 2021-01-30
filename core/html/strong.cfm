
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				<!--- NOTE: Explicit font-weight needed for Lotus Notes. --->
				font-weight: 800 ;
			</core:Styles>

			<strong style="#style#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</strong>

		</cfoutput>	
	</cfcase>
</cfswitch>
