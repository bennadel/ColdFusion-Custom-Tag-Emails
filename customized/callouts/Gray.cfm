
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../../core/" />
<cfimport prefix="html" taglib="../../core/html/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<!---
				Entity theming has to happen in the START execution mode so that it can
				be applied to the child elements of the tag.
			--->
			<core:HtmlEntityTheme entity="h3">
				text-align: center ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="p">
				font-size: 13px ;
				line-height: 18px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="p" class="special">
				color: deeppink ;
			</core:HtmlEntityTheme>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityStyle="#attributes.style#">
				background-color: ##f0f0f0 ;
				padding: 20px 30px 20px 30px ;
			</core:Styles>
			<core:MaxWidthStyles>
				.standard-gray-callout__content {
					padding: 10px 10px 10px 10px ;
				}
			</core:MaxWidthStyles>

			<core:BlockMargins margins="#attributes.margins#">

				<html:table width="100%" margins="none" class="standard-gray-callout">
				<html:tr>
					<html:td class="#trim( 'standard-gray-callout__content #attributes.class#' )#" style="#inlineStyle#">

						#thistag.generatedContent#

					</html:td>
				</html:tr>
				</html:table>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
