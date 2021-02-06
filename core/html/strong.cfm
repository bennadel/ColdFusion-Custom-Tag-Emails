<!---
	CAUTION: For INLINE ELEMENTS, we have to be fanatical in the way that we manage the
	output of the ColdFusion custom tag since we don't want to inadvertently add any
	leading or trailing whitespace around the tag content. As such, we're going to wrap
	the output in a custom tag that will trim the output.
---><cf__inline_html_element_trimmer>

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
				entityName="strong"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				<!--- NOTE: Explicit font-weight needed for Lotus Notes. --->
				font-weight: 800 ;
			</core:Styles>

			<strong class="#trim( 'html-entity-strong #attributes.class#' )#" style="#inlineStyle#">#thistag.generatedContent#</strong>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>	
	</cfcase>
</cfswitch>

<!--- End of fanatical whitespace management. --->
</cf__inline_html_element_trimmer><cfexit method="exitTemplate" />
