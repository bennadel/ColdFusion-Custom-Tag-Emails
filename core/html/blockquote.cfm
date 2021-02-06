
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
				border-left: 4px solid ##cccccc ;
				font-style: italic ;
				padding: 5px 20px 5px 30px ;
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<table width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation">
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
