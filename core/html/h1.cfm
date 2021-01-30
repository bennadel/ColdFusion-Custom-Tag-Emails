
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margin" type="string" default="normal large" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				font-family: #getBaseTagData( "cf_email" ).coreTitleFont# ;
				font-size: 175% ;
				font-weight: #getBaseTagData( "cf_email" ).coreTitleFontWeight# ;
				line-height: 1.35 ;
				Margin: 0 ; <!--- For outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ; <!--- For outlook. --->
				padding: 0px ;
			</core:Styles>

			<core:Margin size="#attributes.margin.listFirst( ' ' )#" />

			<h1 style="#style#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</h1>

			<core:Margin size="#attributes.margin.listLast( ' ' )#" />

		</cfoutput>
	</cfcase>
</cfswitch>
