
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				font-size: 100% ;
				line-height: 1.45 ;
				margin-bottom: 3px ;
				margin-top: 3px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
			</core:Styles>

			<li style="#style#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</li>

		</cfoutput>
	</cfcase>
</cfswitch>
