
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.color" type="string" default="pink" />
<cfparam name="attributes.href" type="string" />
<cfparam name="attributes.margins" type="string" default="normal xlarge" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles variable="outerLinkStyle">
				display: block ;
				text-decoration: none ;
			</core:Styles>
			<core:Styles variable="wrapperStyle">
				background-color: #theme.colors.primary# ;
				border-radius: 48px 48px 48px 48px ;
				font-size: 16px ;
				line-height: 1 ;
				padding: 24px 56px 24px 56px ;
			</core:Styles>
			<core:Styles variable="innerLinkStyle">
				border: 0 ;
				color: #theme.colors.onPrimary# ;
				display: block ;
				font-family: #theme.fonts.body.family# ;
				font-size: #theme.fonts.body.size# ;
				font-weight: 500 ;
				letter-spacing: 0.05px ;
				line-height: 1 ;
				text-decoration: none ;
				text-transform: uppercase ;
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<!---
					I know this looks crazy and it definitely "invalid HTML". But, I believe
					this is part of a "bulletproof button" technique.
					--
					NOTE: "cellpadding" is needed for Lotus Notes.
				--->
				<a href="#attributes.href#" target="_blank" style="#outerLinkStyle#">
					<table cellpadding="20" cellspacing="0" align="center" role="presentation">
					<tbody>
						<tr>
							<!--- NOTE: "bgcolor" is needed for Lotus Notes. --->
							<td bgcolor="#theme.colors.primary#" style="#wrapperStyle#">
								<a href="#attributes.href#" target="_blank" style="#innerLinkStyle#">
									#thistag.generatedContent#
								</a>
							</td>
						</tr>
					</tbody>
					</table>
				</a>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
