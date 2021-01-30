
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.size" type="string" default="normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfswitch expression="#attributes.size#">
				<cfcase value="none">

					<cfexit method="exitTag" />

				</cfcase>
				<cfcase value="xsmall">

					<cfset lineHeight = "0.2" />

				</cfcase>
				<cfcase value="small">

					<cfset lineHeight = "0.5" />

				</cfcase>
				<cfcase value="normal">

					<cfset lineHeight = "1.2" />

				</cfcase>
				<cfcase value="large">

					<cfset lineHeight = "1.5" />

				</cfcase>
				<cfcase value="xlarge">

					<cfset lineHeight = "2.5" />

				</cfcase>
				<cfdefaultcase>

					<cfthrow
						type="InvalidMarginSize"
						message="Core:Margin invalid margin size"
						detail="Margin: #attributes.size#"
					/>

				</cfdefaultcase>
			</cfswitch>

			<core:Styles variable="style">
				line-height: #lineHeight# ;
				mso-line-height-rule: exactly ;
			</core:Styles>

			<div style="#style#">
				<br />
			</div>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
