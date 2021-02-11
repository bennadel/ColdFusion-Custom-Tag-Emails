<!---
	Some good information on targeting MSO versions can be seen here in StackOverflow's
	email best practices documentation: https://stackoverflow.design/email/base/mso/
--->

<!--- Define custom tag attributes. --->
<cfparam name="attributes.gte" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfif len( attributes.gte )>
				<!--[if gte mso #attributes.gte#]>
			<cfelse>
				<!--[if mso]>
			</cfif>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<![endif]-->

		</cfoutput>
	</cfcase>
</cfswitch>
