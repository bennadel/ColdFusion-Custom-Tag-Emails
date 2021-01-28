
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.href" type="string" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				color: ##ff3366 ;
				text-decoration: none ;
			</core:Styles>

			<a style="#style#" href="#attributes.href#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</a>

		</cfoutput>
	</cfcase>
</cfswitch>
