<!---
	Some good information on targeting MSO versions can be seen here in StackOverflow's
	email best practices documentation: https://stackoverflow.design/email/base/mso/
--->

<!--- Define custom tag attributes. --->
<cfparam name="attributes.gteVersion" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfif len( attributes.gteVersion )>
				<!--[if (gte mso #attributes.gteVersion#)|(IE)]>
			<cfelse>
				<!--[if (mso)|(IE)]>
			</cfif>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<![endif]-->

		</cfoutput>
	</cfcase>
</cfswitch>
