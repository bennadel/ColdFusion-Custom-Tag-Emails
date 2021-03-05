
<!--- Get default margins for entity. --->
<cfset entityMargins = getBaseTagData( "cf_email" ).providers[ "margins.hr" ] />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="#entityMargins#" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfmodule
				template="../Styles.cfm"
				variable="inlineStyle"
				entityName="hr"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</cfmodule>

			<cfmodule template="../BlockMargins.cfm" margins="#attributes.margins#">

				<div
					aria-hidden="true"
					class="#trim( 'html-entity-hr #attributes.class#' )#"
					style="#inlineStyle#">
					&nbsp;<br />
				</div>

			</cfmodule>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
