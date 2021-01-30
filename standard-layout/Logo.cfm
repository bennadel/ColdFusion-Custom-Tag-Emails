
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
				background-color: ##222222 ;
				padding: 26px 0px 40px 0px ;
			</core:Styles>
			<core:Styles variable="logoStyle">
				color: ##fefefe ;
				font-family: serif ;
				font-size: 40px ;
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
				<td class="#containerClass#" style="#containerStyle#">

					<a href="https://www.bennadel.com" class="#logoClass#" style="#logoStyle#">
						bn
					</a>

				</td>
			</tr>
			</table>

		</cfoutput>
	</cfcase>
</cfswitch>
