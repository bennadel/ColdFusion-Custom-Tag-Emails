
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.teaser" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfif ! attributes.teaser.len()>

				<cfexit method="exitTag" />

			</cfif>

			<core:Styles variable="style">
				color: #getBaseTagData( "cf_email" ).coreBackgroundColor# ;
				font-size: 1px ;
				line-height: 1px ;
				max-height: 0px ;
				max-width: 0px ;
				mso-line-height-rule: exactly ;
				opacity: 0 ;
				overflow: hidden ;
				visibility: hidden ;
			</core:Styles>

			<div style="#style#">
				#encodeForHtml( attributes.teaser )#
			</div>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
