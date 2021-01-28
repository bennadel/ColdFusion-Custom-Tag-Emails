
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset titleClass = "c-#createUniqueId()#-title" />

			<core:Styles variable="style">
				color: ##313745 ;
				font-family: -apple-system, BlinkMacSystemFont, 'San Francisco', 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif ;
				font-size: 28px ;
				font-weight: 600 ;
				margin: 0px 0px 40px ;
				line-height: 33px ;
				padding: 0px 0px 0px 0px ;
			</core:Styles>
			<core:ResponsiveStyles>
				@media only screen and ( max-width: 400px ) {

					.#titleClass# {
						font-size: 22px !important ;
						line-height: 27px !important ;
					}

				}
			</core:ResponsiveStyles>

			<h1 style="#style#" class="#titleClass#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</h1>

		</cfoutput>
	</cfcase>
</cfswitch>
