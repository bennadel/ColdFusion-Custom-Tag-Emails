
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none xxsmall" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles
				variable="inlineStyle"
				entityName="h4"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				font-family: #theme.fonts.h4.family# ;
				font-size: #theme.fonts.h4.size# ;
				font-weight: #theme.fonts.h4.weight# ;
				line-height: #theme.fonts.h4.lineHeight# ;
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
				padding: 0px ;
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<h4 class="#trim( 'html-entity-h4 #attributes.class#' )#" style="#inlineStyle#">
					#thistag.generatedContent#
				</h4>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
