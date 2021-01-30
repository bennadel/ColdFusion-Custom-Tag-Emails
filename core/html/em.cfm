
<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<em>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</em>

		</cfoutput>	
	</cfcase>
</cfswitch>
