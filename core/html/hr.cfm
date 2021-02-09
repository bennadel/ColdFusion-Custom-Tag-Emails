
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="small normal" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles
				variable="inlineStyle"
				entityName="hr"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<div
					aria-hidden="true"
					class="#trim( 'html-entity-hr #attributes.class#' )#"
					style="#inlineStyle#">
					&nbsp;<br />
				</div>

			</core:BlockMargins>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
