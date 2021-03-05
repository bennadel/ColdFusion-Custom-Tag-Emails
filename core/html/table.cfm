
<!--- Get default margins for entity. --->
<cfset entityMargins = getBaseTagData( "cf_email" ).providers[ "margins.table" ] />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.align" type="string" default="" />
<cfparam name="attributes.border" type="string" default="0" />
<cfparam name="attributes.cellspacing" type="string" default="0" />
<cfparam name="attributes.cellpadding" type="string" default="0" />
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="#entityMargins#" />
<cfparam name="attributes.presentation" type="boolean" default="true" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.width" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfmodule
				template="../Styles.cfm"
				variable="inlineStyle"
				entityName="table"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</cfmodule>

			<cfmodule template="../BlockMargins.cfm" margins="#attributes.margins#">

				<table
					<cfif len( attributes.width )>
						width="#attributes.width#"
					</cfif>
					<cfif len( attributes.align )>
						align="#attributes.align#"
					</cfif>
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

			</cfmodule>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
