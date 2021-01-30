
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margin" type="string" default="none normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="style">
				margin-bottom: 0px ;
				margin-top: 0px ;
			</core:Styles>

			<core:Margin size="#attributes.margin.listFirst( ' ' )#" />

			<ul style="#style#">

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			</ul>

			<core:Margin size="#attributes.margin.listLast( ' ' )#" />

		</cfoutput>
	</cfcase>
</cfswitch>
