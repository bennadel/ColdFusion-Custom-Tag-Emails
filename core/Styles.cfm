
<!--- Define custom tag attributes. --->
<cfparam name="attributes.variable" type="variableName" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<!--- Nothing to do here. --->

	</cfcase>
	<cfcase value="end">

		<cfset caller[ attributes.variable ] = thistag.generatedContent
			.reReplace( "\s+", " ", "all" )
			.reReplace( "\s*;\s*", "; ", "all" )
			.reReplace( "\s*:\s*", ":", "all" )
			.reReplace( "\s*,\s*", ",", "all" )
			.trim()
		/>

		<!--- This tag doesn't generate output - it only manipulates variable. --->
		<cfset thistag.generatedContent = "" />

	</cfcase>
</cfswitch>
