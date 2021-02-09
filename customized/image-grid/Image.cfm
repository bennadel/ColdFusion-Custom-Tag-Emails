
<!--- Define custom tag attributes. --->
<cfparam name="attributes.title" type="string" />
<cfparam name="attributes.src" type="string" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfset getBaseTagData( "cf_list" ).images.append({
			title: attributes.title,
			src: attributes.src
		}) />

		<cfexit method="exitTag" />

	</cfcase>
</cfswitch>
