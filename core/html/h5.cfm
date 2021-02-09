
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none xxsmall" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="h5"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<h5
					class="#trim( 'html-entity-h5 #attributes.class#' )#"
					style="#inlineStyle#">
					#thistag.generatedContent#
				</h5>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
