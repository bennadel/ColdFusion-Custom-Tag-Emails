
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.size" type="string" default="normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfif ( attributes.size eq "none" )>
				
				<cfexit method="exitTag" />

			</cfif>

			<cfset sizes = {
				xxxsmall: "2px",
				xxsmall: "6px",
				xsmall: "8px",
				small: "12px",
				normal: "16px",
				large: "20px",
				xlarge: "22px",
				xxlarge: "28px",
				xxxlarge: "32px"
			} />

			<cfif ! sizes.keyExists( attributes.size )>

				<cfthrow
					type="InvalidMarginSize"
					message="Core:Margin invalid margin size"
					detail="Margin: #attributes.size#"
				/>

			</cfif>

			<core:Styles variable="tableStyle">
				height: #sizes[ attributes.size ]# ;
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
			</core:Styles>
			<core:Styles variable="tdStyle">
				font-family: arial, verdana, helvetica, sans-serif ;
				font-size: #sizes[ attributes.size ]# ;
				height: #sizes[ attributes.size ]# ;
				line-height: 70% ; <!--- Using a smaller line-height for Outlook. --->
				mso-line-height-rule: exactly ; <!--- For Outlook. --->
				overflow: hidden ;
			</core:Styles>
			<core:Styles variable="divStyle">
				height: #sizes[ attributes.size ]# ;
				overflow: hidden ;
			</core:Styles>

			<table aria-hidden="true" role="presentation" border="0" cellpadding="0" cellspacing="0" style="#tableStyle#">
			<tr>
				<td style="#tdStyle#">
					<!---
						I find that using height on the Table/TD alone doesn't work
						consistently in AOL. But, wrapping a Div seems to help.
					--->
					<div style="#divStyle#">
						&nbsp;<br />
					</div>
				</td>
			</tr>
			</table>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
