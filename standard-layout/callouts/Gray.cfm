
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../../core/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />
<cfparam name="attributes.style" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<!--- Theme styles. --->
			<core:HtmlEntityTheme entity="h2">
				font-size: 18px ;
				font-weight: 800 ;
				line-height: 23px ;
				text-align: center ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="p">
				font-size: 16px ;
				font-weight: 100 ;
				line-height: 21px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="a">
				color: #theme.colors.onSurface# ;
			</core:HtmlEntityTheme>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfset tableClass = "standard-gray-callout" />
			<cfset tdClass = "#tableClass#__content" />

			<core:Styles
				variable="inlineStyle"
				entityStyle="#attributes.style#">
				padding: 20px 30px 20px 30px ;
			</core:Styles>
			<core:HeaderStyles runonce="true">
				.#tdClass# a:hover {
					color: #theme.colors.link# !important ;
				}

				@media only screen and ( max-width: #theme.width#px ) {
					.#tdClass# {
						padding: 10px 10px 10px 10px !important ;
					}
				}
			</core:HeaderStyles>

			<core:BlockMargins margins="#attributes.margins#">

				<table role="presentation" width="100%" border="0" cellspacing="0" cellpadding="0" class="#tableClass#">
				<tr>
					<td bgcolor="##f0f0f0" class="#trim( '#tdClass# #attributes.class#' )#" style="#inlineStyle#">
						#thistag.generatedContent#
					</td>
				</tr>
				</table>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
