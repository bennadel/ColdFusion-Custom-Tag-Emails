<!---
	CAUTION: For INLINE ELEMENTS, we have to be fanatical in the way that we manage the
	output of the ColdFusion custom tag since we don't want to inadvertently add any
	leading or trailing whitespace around the tag content. As such, we're going to wrap
	the output in a custom tag that will trim the output.
---><cfmodule template="../TrimOutput.cfm">

<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="symbol"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<span
				class="#trim( 'html-entity-symbol #attributes.class#' )#"
				style="#inlineStyle#"
				>#thistag.generatedContent#</span>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- End of fanatical whitespace management. --->
</cfmodule><cfexit method="exitTemplate" />