
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="containerStyle">
				padding: 25px 0px 30px 0px ;
				text-align: center ;
			</core:Styles>
			<core:Styles variable="titleStyle">
				color: ##313745 ;
				font-family: #getBaseTagData( "cf_email" ).coreTitleFont# ;
				font-size: 12px ;
				letter-spacing: 0.5px ;
				line-height: 17px ;
				margin: 0px 0px 7px 0px ;
				text-transform: uppercase ;
			</core:Styles>
			<core:Styles variable="subtitleStyle">
				color: ##6c7689 ;
				font-family: #getBaseTagData( "cf_email" ).coreCopyFont# ;
				font-size: 12px ;
				font-weight: lighter ;
				line-height: 17px ;
				margin: 0px 0px 0px 0px ;
			</core:Styles>

			<table align="center" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td style="#containerStyle#">

						<h3 style="#titleStyle#">
							Powered by Lucee CFML
						</h3>

						<h4 style="#subtitleStyle#">
							The leading open-source CFML application server/engine
						</h4>

					</td>
				</tr>
			</tbody>
			</table>

		</cfoutput>
	</cfcase>
</cfswitch>
