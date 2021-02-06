
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="standard" taglib="./" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />
			<cfset theme.importUrls.append( "https://fonts.googleapis.com/css?family=Poppins:100,200,300,500|Roboto:100,200,300,400,500,600,700" ) />
			<cfset theme.fonts.titleFontFamily = "Poppins, BlinkMacSystemFont, Helvetica, Arial, sans-serif" />
			<cfset theme.fonts.baseFontFamily = "Roboto, BlinkMacSystemFont, Helvetica, Arial, sans-serif" />

			<cfset tableClass = "c-#createUniqueId()#" />
			<cfset contentClass = "c-#createUniqueId()#" />
			<cfset gutterClass = "c-#createUniqueId()#" />

			<core:Styles variable="tableStyle">
				border: 1px solid ##ebecee ;
				border-width: 0px 1px 1px 1px ;
			</core:Styles>
			<core:Styles variable="topBorderStyle">
				font-size: 1px ;
				height: 2px ;
				line-height: 2px ;
			</core:Styles>
			<core:Styles variable="contentStyle">
				color: #theme.colors.onSurface# ;
				font-family: #theme.fonts.baseFontFamily# ;
				font-size: #theme.fonts.baseFontSize# ;
				font-weight: #theme.fonts.baseFontWeight# ;
				line-height: 1.45em ;
				padding: 45px 0px 30px 0px ;
			</core:Styles>
			<core:Styles variable="footerStyle">
				border-top: 1px solid ##ebecee ;
				color: ##6c7689 ;
				font-family: #theme.fonts.baseFontFamily# ;
				font-size: 12px ;
				font-weight: #theme.fonts.baseFontWeight# ;
				line-height: 1.41 ;
				padding: 20px 0px 20px 0px ;
			</core:Styles>
			<core:Styles variable="footerLinkStyle">
				color: ##276ee5 ;
				text-decoration: none ;
			</core:Styles>
			<core:HeaderStyles>
				@media only screen and ( max-width: 650px ) {

					.#tableClass# {
						width: 100% !important ;
					}

					.#gutterClass# {
						width: 20px !important ;
					}

				}

				@media only screen and ( max-width: 549px ) {

					.#contentClass# {
						font-size: 16px !important ;
					}

				}
			</core:HeaderStyles>

			<table width="650" align="center" cellpadding="0" cellspacing="0" class="#tableClass#" style="#tableStyle#" role="presentation">
			<tbody>
				<tr>
					<!--- NOTE: "bgcolor" is needed for Lotus Notes. --->
					<td colspan="3" bgcolor="##ff3366" style="#topBorderStyle#">
						<br />
					</td>
				</tr>
				<tr>
					<td width="60" class="#gutterClass#">
						<!--- Left margin. ---><br />
					</td>
					<td class="#contentClass#" style="#contentStyle#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

					</td>
					<td width="60" class="#gutterClass#">
						<!--- Right margin. ---><br />
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center" bgcolor="##f8f8fa" style="#footerStyle#">

						Questions?
						<a href="https://www.bennadel.com" target="_blank" style="#footerLinkStyle#">I'm here to help.</a>

					</td>
				</tr>
			</tbody>
			</table>

			<standard:Footer />

		</cfoutput>
	</cfcase>
</cfswitch>
