
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margin" type="string" default="none xsmall" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				font-family: #getBaseTagData( "cf_email" ).coreTitleFont# ;
				font-size: 100% ;
				font-weight: #getBaseTagData( "cf_email" ).coreTitleFontWeight# ;
				line-height: 1.45 ;
				Margin: 0 ; <!--- For outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
				padding: 0px ;
			</core:Styles>

			<core:Margin size="#attributes.margin.listFirst( ' ' )#" />

			<h5 style="#style#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</h5>

			<core:Margin size="#attributes.margin.listLast( ' ' )#" />

		</cfoutput>
	</cfcase>
</cfswitch>
