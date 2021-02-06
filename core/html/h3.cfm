
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="normal xsmall" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles
				variable="inlineStyle"
				entityName="h3"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				font-family: #theme.fonts.h3.family# ;
				font-size: #theme.fonts.h3.size# ;
				font-weight: #theme.fonts.h3.weight# ;
				line-height: #theme.fonts.h3.lineHeight# ;
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
				padding: 0px ;
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<h3 class="#trim( 'html-entity-h3 #attributes.class#' )#" style="#inlineStyle#">
					#thistag.generatedContent#
				</h3>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
