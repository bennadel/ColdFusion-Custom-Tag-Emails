
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
				line-height: 2px ;
				height: 2px ;
			</core:Styles>
			<core:Styles variable="contentStyle">
				color: ##22252b ;
				font-family: #getBaseTagData( "cf_email" ).coreCopyFont# ;
				font-size: 16px ;
				line-height: 1.4 ;
				padding: 20px 0px 30px 0px ;
			</core:Styles>
			<core:Styles variable="footerStyle">
				border-top: 1px solid ##ebecee ;
				color: ##6c7689 ;
				font-size: 12px ;
				line-height: 17px ;
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
			</core:ResponsiveStyles>

			<table width="650" align="center" cellpadding="0" cellspacing="0" style="#tableStyle#" class="#tableClass#">
			<tbody>
				<tr>
					<td colspan="3" style="#topBorderStyle#" bgcolor="##ff3366">
						<br />
					</td>
				</tr>
				<tr>
					<td width="60" class="#gutterClass#">
						<!--- Left margin. ---><br />
					</td>
					<td style="#contentStyle#" class="#contentClass#">

						<standard:Logo />

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
					<td colspan="3" align="center" style="#footerStyle#" bgcolor="##f8f8fa">

						Questions?
						<a href="##" style="#footerLinkStyle#">We're here to help.</a>

					</td>
				</tr>
			</tbody>
			</table>

			<core:Footer />

		</cfoutput>
	</cfcase>
</cfswitch>
