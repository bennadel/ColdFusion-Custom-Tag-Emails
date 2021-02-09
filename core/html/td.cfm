
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.align" type="string" default="left" />
<cfparam name="attributes.bgcolor" type="string" default="" />
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.colspan" type="string" default="" />
<cfparam name="attributes.rowspan" type="string" default="" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.valign" type="string" default="top" />
<cfparam name="attributes.width" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="td"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<td
				<cfif len( attributes.colspan )>
					colspan="#attributes.colspan#"
				</cfif>
				<cfif len( attributes.rowspan )>
					rowspan="#attributes.rowspan#"
				</cfif>
				<cfif len( attributes.width )>
					width="#attributes.width#"
				</cfif>
				align="#attributes.align#"
				valign="#attributes.valign#"
				<cfif len( attributes.bgcolor )>
					bgcolor="#attributes.bgcolor#"
				</cfif>
				class="#trim( 'html-entity-td #attributes.class#' )#"
				style="#inlineStyle#">
				#thistag.generatedContent#
			</td>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
