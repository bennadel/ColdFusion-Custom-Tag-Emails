<!---
	CAUTION: For INLINE ELEMENTS, we have to be fanatical in the way that we manage the
	output of the ColdFusion custom tag since we don't want to inadvertently add any
	leading or trailing whitespace around the tag content. As such, we're going to wrap
	the output in a custom tag that will trim the output.
---><cf__inline_html_element_trimmer>

<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.alt" type="string" default="" />
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.height" type="string" default="" />
<cfparam name="attributes.src" type="string" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.width" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="img"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				border: none ;
			</core:Styles>

			<img
				src="#encodeForHtmlAttribute( attributes.src )#"
				alt="#encodeForHtmlAttribute( attributes.alt )#"
				<cfif attributes.width.len()>
					width="#encodeForHtmlAttribute( attributes.width )#"
				</cfif>
				<cfif attributes.height.len()>
					height="#encodeForHtmlAttribute( attributes.height )#"
				</cfif>
				class="#trim( 'html-entity-img #attributes.class#' )#"
				style="#inlineStyle#"
			/>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- End of fanatical whitespace management. --->
</cf__inline_html_element_trimmer><cfexit method="exitTemplate" />
