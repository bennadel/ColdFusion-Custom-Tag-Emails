
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<core:HtmlEntityTheme entity="a">
			color: green ;
			text-decoration: underline ;
		</core:HtmlEntityTheme>

	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles variable="bodyContentStyle">
				color: #theme.colors.onSurface# ;
				font-family: #theme.fonts.body.family# ;
				font-size: #theme.fonts.body.size# ;
				font-weight: #theme.fonts.body.weight# ;
				line-height: #theme.fonts.body.lineHeight# ;
				mso-line-height-rule: exactly ; <!--- For Outlook. --->
				padding: 30px 0px 30px 0px ;
			</core:Styles>
			<core:HeaderContent>
				<!--[if mso]>
				<style>
					.html-entity-h1,
					.html-entity-h2,
					.html-entity-h3,
					.html-entity-h4,
					.html-entity-h5
					{
						line-height: 115% !important ;
					}

					.html-entity-p,
					.html-entity-li
					{
						line-height: 125% !important ;
					}
				</style>
				<![endif]-->
			</core:HeaderContent>
			<core:HeaderStyles>

				@media only screen and ( max-width: #theme.width#px ) {

					.email-body-wrapper {
						width: 100% !important ;
					}

					.email-body-gutter {
						width: 20px !important ;
					}

				}

			</core:HeaderStyles>

			<table width="#theme.width#" align="center" cellpadding="0" cellspacing="0" class="email-body-wrapper" role="presentation">
			<tbody>
				<tr>
					<td width="30" class="email-body-gutter">
						<!--- Left margin. ---><br />
					</td>
					<td class="email-body-content" style="#bodyContentStyle#">

						#thistag.generatedContent#

					</td>
					<td width="30" class="email-body-gutter">
						<!--- Right margin. ---><br />
					</td>
				</tr>
			</tbody>
			</table>

			<core:Margin size="large" />

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
