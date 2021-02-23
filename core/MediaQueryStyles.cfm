
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.injectImportant" type="boolean" default="true" />
<cfparam name="attributes.media" type="string" default="screen" />
<cfparam name="attributes.name" type="string" />
<cfparam name="attributes.runOnce" type="boolean" default="true" />
<cfparam name="attributes.value" type="string" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:HeaderStyles
				injectImportant="#attributes.injectImportant#"
				runOnce="#attributes.runOnce#">
				@media #attributes.media# and ( #attributes.name#: #attributes.value# ) {

					#thistag.generatedContent#

				}
			</core:HeaderStyles>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
