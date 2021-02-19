
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
				entityName="blockquote"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<!---
					CAUTION: We are using raw HTML elements here instead of the "html"
					custom tags module so that we don't accidentally apply Theme styles
					to this markup.
				--->
				<table role="presentation" width="100%" border="0" cellpadding="13" cellspacing="0">
				<tr>
					<td class="#trim( 'html-entity-blockquote #attributes.class#' )#" style="#inlineStyle#">
						#thistag.generatedContent#
					</td>
				</tr>
				</table>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
