
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margins" type="string" default="none normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfset margins = attributes.margins.listToArray( " " ) />

		<core:Margin size="#margins.first()#" />

	</cfcase>
	<cfcase value="end">

		<core:Margin size="#margins.last()#" />
			
	</cfcase>
</cfswitch>
