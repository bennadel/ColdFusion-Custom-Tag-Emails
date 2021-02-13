
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.injectImportant" type="boolean" default="true" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />
			<cfset theme.enableDarkModeSupport = true />

			<core:MediaQueryStyles
				name="prefers-color-scheme"
				value="dark"
				injectImportant="#attributes.injectImportant#">
				#thistag.generatedContent#
			</core:MediaQueryStyles>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
