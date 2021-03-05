
<!--- Get default margins for entity. --->
<cfset entityMargins = getBaseTagData( "cf_email" ).providers[ "margins.h4" ] />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="#entityMargins#" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfmodule
				template="../Styles.cfm"
				variable="inlineStyle"
				entityName="h4"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</cfmodule>

			<cfmodule template="../BlockMargins.cfm" margins="#attributes.margins#">

				<h4
					class="#trim( 'html-entity-h4 #attributes.class#' )#"
					style="#inlineStyle#">
					#thistag.generatedContent#
				</h4>

			</cfmodule>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
