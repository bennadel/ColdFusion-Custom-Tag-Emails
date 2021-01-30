
<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">

		<cfset getBaseTagData( "cf_email" )
			.responsiveStyleBlocks
			.append( thistag.generatedContent )
		/>

		<!--- This tag doesn't generate output - it only manipulates variables. --->
		<cfset thistag.generatedContent = "" />

	</cfcase>
</cfswitch>
