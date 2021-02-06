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
				entityName="mark"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				background-color: yellow ;
				display: inline-block ;
				font-weight: bold ;
				padding: 0px 4px 0px 4px ;
			</core:Styles>

			<mark class="#trim( 'html-entity-mark #attributes.class#' )#" style="#inlineStyle#">#thistag.generatedContent#</mark>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- End of fanatical whitespace management. --->
</cf__inline_html_element_trimmer><cfexit method="exitTemplate" />
