
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.type" type="string" default="disc" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="ul"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<ul
					type="#attributes.type#"
					class="#trim( 'html-entity-ul #attributes.class#' )#"
					style="#inlineStyle#">
					#thistag.generatedContent#
				</ul>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
