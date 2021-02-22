
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.size" type="string" default="normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfif (
				( attributes.size eq "none" ) ||
				( attributes.size eq "0" )
				)>

				<cfexit method="exitTag" />

			</cfif>

			<!--- NOTE: Moving this output to a Function so that it can be cached. --->
			#generateSpacerTable( attributes.size )#

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cffunction name="generateSpacerTable" output="true" cachedwithin="request">

	<cfargument name="size" type="string" required="true" />

	<cfswitch expression="#arguments.size#">
		<cfcase value="xxxsmall">
			<cfset var height = "2px" />
		</cfcase>
		<cfcase value="xxsmall">
			<cfset var height = "4px" />
		</cfcase>
		<cfcase value="xsmall">
			<cfset var height = "8px" />
		</cfcase>
		<cfcase value="small">
			<cfset var height = "12px" />
		</cfcase>
		<cfcase value="normal">
			<cfset var height = "16px" />
		</cfcase>
		<cfcase value="large">
			<cfset var height = "20px" />
		</cfcase>
		<cfcase value="xlarge">
			<cfset var height = "24px" />
		</cfcase>
		<cfcase value="xxlarge">
			<cfset var height = "28px" />
		</cfcase>
		<cfcase value="xxxlarge">
			<cfset var height = "32px" />
		</cfcase>
		<cfcase value="xxxxlarge">
			<cfset var height = "36px" />
		</cfcase>
		<cfdefaultcase>
			<cfif isNumeric( arguments.size )>

				<cfset var height = "#arguments.size#px" />

			<cfelse>

				<cfthrow
					type="InvalidMarginSize"
					message="Core:Margin invalid margin size"
					detail="Margin: #arguments.size#"
				/>

			</cfif>
		</cfdefaultcase>
	</cfswitch>

	<core:Styles variable="tableStyle">
		height: #height# ;
		Margin: 0 ; <!--- For Outlook. --->
		margin: 0px ;
	</core:Styles>
	<core:Styles variable="tdStyle">
		font-family: arial, verdana, helvetica, sans-serif ;
		font-size: #height# ;
		height: #height# ;
		line-height: 70% ; <!--- Using a smaller line-height for Outlook. --->
		mso-line-height-rule: exactly ; <!--- For Outlook. --->
		overflow: hidden ;
	</core:Styles>
	<core:Styles variable="divStyle">
		height: #height# ;
		overflow: hidden ;
	</core:Styles>

	<!---
		CAUTION: We are using raw HTML elements here instead of the "html" custom tags
		module so that we don't accidentally apply Theme styles to this markup.
	--->
	<table aria-hidden="true" role="presentation" width="100%" border="0" cellpadding="0" cellspacing="0" style="#variables.tableStyle#">
	<tr>
		<td style="#variables.tdStyle#">
			<!---
				I find that using height on the Table/TD alone doesn't work
				consistently in AOL. But, wrapping a Div seems to help.
			--->
			<div style="#variables.divStyle#">
				&nbsp;<br />
			</div>
		</td>
	</tr>
	</table>

</cffunction>
