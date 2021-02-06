
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

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles
				variable="inlineStyle"
				entityName="p"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				font-size: #theme.fonts.body.size# ;
				line-height: #theme.fonts.body.lineHeight# ;
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<p class="#trim( 'html-entity-p #attributes.class#' )#" style="#inlineStyle#">
					#thistag.generatedContent#
				</p>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
