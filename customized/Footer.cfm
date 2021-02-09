
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles variable="containerStyle">
				padding: 25px 0px 30px 0px ;
				text-align: center ;
			</core:Styles>
			<core:HtmlEntityTheme entity="h3">
				color: ##313745 ;
				font-size: 12px ;
				letter-spacing: 0.5px ;
				line-height: 17px ;
				text-transform: uppercase ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h4">
				color: ##6c7689 ;
				font-size: 12px ;
				font-weight: 300 ;
				line-height: 17px ;
			</core:HtmlEntityTheme>

			<html:table align="center">
			<html:tr>
				<html:td style="#containerStyle#">

					<html:h3 margins="none small">
						Powered by Lucee CFML
					</html:h3>

					<html:h4 margins="none">
						The leading open-source CFML application server/engine
					</html:h4>

				</html:td>
			</html:tr>
			</html:table>

		</cfoutput>
	</cfcase>
</cfswitch>
