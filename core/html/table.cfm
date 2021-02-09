
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.align" type="string" default="center" />
<cfparam name="attributes.border" type="string" default="0" />
<cfparam name="attributes.cellspacing" type="string" default="0" />
<cfparam name="attributes.cellpadding" type="string" default="0" />
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />
<cfparam name="attributes.presentation" type="boolean" default="true" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.width" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="table"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<table
					<cfif len( attributes.width )>
						width="#attributes.width#"
					</cfif>
					align="#attributes.align#"
					border="#attributes.border#"
					cellspacing="#attributes.cellspacing#"
					cellpadding="#attributes.cellpadding#"
					<cfif attributes.presentation>
						role="presentation"
					</cfif>
					class="#trim( 'html-entity-table #attributes.class#' )#"
					style="#inlineStyle#">
					#thistag.generatedContent#
				</table>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
