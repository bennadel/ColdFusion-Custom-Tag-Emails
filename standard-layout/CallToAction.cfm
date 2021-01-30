
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.color" type="string" default="pink" />
<cfparam name="attributes.href" type="string" />
<cfparam name="attributes.margin" type="string" default="normal xlarge" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="outerLinkStyle">
				display: block ;
				text-decoration: none ;
			</core:Styles>
			<core:Styles variable="wrapperStyle">
				background-color: ##ff3366 ;
				border-radius: 48px 48px 48px 48px ;
				font-size: 16px ;
				line-height: 1 ;
				padding: 24px 56px 24px 56px ;
			</core:Styles>
			<core:Styles variable="innerLinkStyle">
				border: 0 ;
				color: ##fefefe ;
				display: block ;
				font-family: #getBaseTagData( "cf_email" ).coreCopyFont# ;
				font-size: 100% ;
				font-weight: 500 ;
				letter-spacing: 0.05px ;
				line-height: 1 ;
				text-decoration: none ;
				text-transform: uppercase ;
			</core:Styles>

			<core:Margin size="#attributes.margin.listFirst( ' ' )#" />

			<!---
				I know this looks crazy and it definitely "invalid HTML". But, I believe
				this is part of a "bulletproof button" technique.
				--
				NOTE: "cellpadding" is needed for Lotus Notes.
			--->
			<a href="#attributes.href#" target="_blank" style="#outerLinkStyle#">
				<table cellpadding="20" cellspacing="0" align="center">
				<tbody>
					<tr>
						<!--- NOTE: "bgcolor" is needed for Lotus Notes. --->
						<td bgcolor="##ff3366" style="#wrapperStyle#">
							<a href="#attributes.href#" target="_blank" style="#innerLinkStyle#">
								#thistag.generatedContent#
							</a>
						</td>
					</tr>
				</tbody>
				</table>
			</a>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

			<core:Margin size="#attributes.margin.listLast( ' ' )#" />

		</cfoutput>
	</cfcase>
</cfswitch>
