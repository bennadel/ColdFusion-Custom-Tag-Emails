
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />
<cfparam name="attributes.style" type="string" default="" />

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
				Margin-bottom: 0 ; <!--- For Outlook. --->
				margin-bottom: 0px ;
				Margin-top: 0 ; <!--- For Outlook. --->
				margin-top: 0px ;
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<ol class="#trim( 'html-entity-ol #attributes.class#' )#" style="#inlineStyle#">
					#thistag.generatedContent#
				</ol>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
