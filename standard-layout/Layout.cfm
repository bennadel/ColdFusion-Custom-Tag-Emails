
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="standard" taglib="./" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

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
				color: #getBaseTagData( "cf_email" ).coreColor# ;
				font-family: #getBaseTagData( "cf_email" ).coreCopyFont# ;
				font-size: #getBaseTagData( "cf_email" ).coreFontSize# ;
				font-weight: #getBaseTagData( "cf_email" ).coreFontWeight# ;
				line-height: 1.45 ;
				padding: 45px 0px 30px 0px ;
			</core:Styles>
			<core:Styles variable="footerStyle">
				border-top: 1px solid ##ebecee ;
				color: ##6c7689 ;
				font-family: #getBaseTagData( "cf_email" ).coreCopyFont# ;
				font-size: 12px ;
				font-weight: #getBaseTagData( "cf_email" ).coreFontWeight# ;
				line-height: 1.41 ;
				padding: 20px 0px 20px 0px ;
			</core:Styles>
			<core:Styles variable="footerLinkStyle">
				color: ##276ee5 ;
				text-decoration: none ;
			</core:Styles>
			<core:ResponsiveStyles>
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
			</core:ResponsiveStyles>

			<table width="650" align="center" cellpadding="0" cellspacing="0" class="#tableClass#" style="#tableStyle#">
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
