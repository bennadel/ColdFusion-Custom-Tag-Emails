
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="normal xsmall" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="h3"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<h3
					class="#trim( 'html-entity-h3 #attributes.class#' )#"
					style="#inlineStyle#">
					#thistag.generatedContent#
				</h3>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
