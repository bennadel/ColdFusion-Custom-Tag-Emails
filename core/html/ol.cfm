
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.type" type="string" default="1" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="ol"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<ol
					type="#attributes.type#"
					class="#trim( 'html-entity-ol #attributes.class#' )#"
					style="#inlineStyle#">
					#thistag.generatedContent#
				</ol>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
