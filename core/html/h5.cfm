
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
				entityName="h5"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				font-family: #theme.fonts.h5.family# ;
				font-size: #theme.fonts.h5.size# ;
				font-weight: #theme.fonts.h5.weight# ;
				line-height: #theme.fonts.h5.lineHeight# ;
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
				padding: 0px ;
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<h5 class="#trim( 'html-entity-h5 #attributes.class#' )#" style="#inlineStyle#">
					#thistag.generatedContent#
				</h5>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
