
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset containerClass = "c-#createUniqueId()#" />
			<cfset logoClass = "c-#createUniqueId()#" />

			<core:Styles variable="containerStyle">
				padding: 26px 0px 40px 0px ;
			</core:Styles>
			<core:Styles variable="logoStyle">
				color: ##22252b ;
				font-family: serif ;
				font-size: 40px ;
				font-style: italic ;
				font-weight: bold ;
				line-height: 40px ;
				text-decoration: none ;
			</core:Styles>
			<core:ResponsiveStyles>
				@media only screen and ( max-width: 400px ) {

					.#containerClass# {
						padding: 6px 0px 20px 0px !important ;
					}

					.#logoClass# {
						font-size: 30px !important ;
						line-height: 30px !important ;
					}

				}
			</core:ResponsiveStyles>

			<table cellpadding="0" cellspacing="0">
			<tr>
				<td style="#containerStyle#" class="#containerClass#">

					<a href="https://www.invisionapp.com" style="#logoStyle#" class="#logoClass#">
						in
					</a>

				</td>
			</tr>
			</table>

		</cfoutput>
	</cfcase>
</cfswitch>
