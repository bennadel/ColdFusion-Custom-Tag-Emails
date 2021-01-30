
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margin" type="string" default="large" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				background-color: #getBaseTagData( "cf_email" ).coreBackgroundColor# ;
				color: #getBaseTagData( "cf_email" ).coreColor# ;
				font-family: #getBaseTagData( "cf_email" ).coreCopyFont# ;
				font-size: #getBaseTagData( "cf_email" ).coreFontSize# ;
				font-smoothing: antialiased ;
				font-weight: #getBaseTagData( "cf_email" ).coreFontWeight# ;
				Margin: 0 ; <!--- For outlook. --->
				margin: 0px ;
				mso-line-height-rule: exactly ;
				padding: 0px ;
				text-rendering: optimizeLegibility ;
				width: 100% ;
				word-break: break-word ;
			</core:Styles>

			<body style="#style#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</body>

		</cfoutput>
	</cfcase>
</cfswitch>
