
<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfmodule
				template="../Styles.cfm"
				variable="inlineStyle"
				entityName="div"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</cfmodule>

			<cfmodule template="../BlockMargins.cfm" margins="#attributes.margins#">

				<div
					class="#trim( 'html-entity-div #attributes.class#' )#"
					style="#inlineStyle#">
					#thistag.generatedContent#
				</div>

			</cfmodule>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
