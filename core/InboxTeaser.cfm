
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

			<core:Styles variable="divStyles">
				display: none ;
				font-size: 0px ;
				height: 0px ;
				line-height: 0px ;
				max-height: 0px ;
				max-width: 0px ;
				mso-hide: all ;
				mso-line-height-rule: exactly ; <!--- For Outlook. --->
				opacity: 0 ;
				overflow: hidden ;
				visibility: hidden ;
				width: 0px ;
			</core:Styles>

			<!---
				CAUTION: We are using raw HTML elements here instead of the "html"
				custom tags module so that we don't accidentally apply Theme styles
				to this markup.
			--->
			<div aria-hidden="true" style="#divStyles#">
				#encodeForHtml( attributes.teaser )#
			</div>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
