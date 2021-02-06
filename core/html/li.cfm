
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles
				variable="inlineStyle"
				entityName="li"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				font-size: #theme.fonts.body.size# ;
				line-height: #theme.fonts.body.lineHeight# ;
				Margin-bottom: 3px ; <!--- For Outlook. --->
				margin-bottom: 3px ;
				Margin-top: 3px ; <!--- For Outlook. --->
				margin-top: 3px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
			</core:Styles>

			<li class="#trim( 'html-entity-li #attributes.class#' )#" style="#inlineStyle#">
				#thistag.generatedContent#
			</li>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
