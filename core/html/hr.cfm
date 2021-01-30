
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margin" type="string" default="small normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				border-top: 1px solid ##cccccc ;
				font-size: 1px ;
				line-height: 1px ;
				Margin: 0 ; <!--- For outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ;
				padding: 0px ;
			</core:Styles>

			<core:Margin size="#attributes.margin.listFirst( ' ' )#" />

			<div style="#style#">
				<br />
			</div>

			<core:Margin size="#attributes.margin.listLast( ' ' )#" />

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
