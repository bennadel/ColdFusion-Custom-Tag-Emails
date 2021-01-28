
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.teaser" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfif ! attributes.teaser.len()>

			<cfexit method="exitTag" />

		</cfif>

	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="style">
				color: ##ffffff ;
				font-size: 1px ;
				line-height: 1px ;
				opacity: 0 ;
				visibility: hidden ;
			</core:Styles>

			<div style="#style#">
				#encodeForHtml( attributes.teaser )#
			</div>

		</cfoutput>
	</cfcase>
</cfswitch>
