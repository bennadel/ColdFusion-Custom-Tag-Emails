
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.color" type="string" default="pink" />
<cfparam name="attributes.href" type="string" />
<cfparam name="attributes.margins" type="string" default="normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:Styles variable="outerLinkStyle">
				display: block ;
			</core:Styles>
			<core:Styles variable="wrapperStyle">
				background-color: #theme.light.primary# ;
				border-radius: 48px 48px 48px 48px ;
				font-size: 16px ;
				line-height: 1 ;
				padding: 24px 56px 24px 56px ;
			</core:Styles>
			<core:Styles variable="innerLinkStyle">
				border: 0 ;
				color: #theme.light.onPrimary# ;
				display: block ;
				letter-spacing: 0.05px ;
			</core:Styles>

			<core:BlockMargins margins="#attributes.margins#">

				<!---
					I know this looks crazy and it is definitely "invalid HTML". However,
					in order to create "bullet proof" buttons without using VML, this
					nested link structure is very helpful.
					--
					NOTE: "cellpadding" is needed for Lotus Notes.
				--->
				<html:a href="#attributes.href#" decoration="false" style="#outerLinkStyle#">
					<html:table align="center" cellpadding="20" margins="none none">
					<html:tr>
						<html:td style="#wrapperStyle#">
							<html:a href="#attributes.href#" decoration="false" style="#innerLinkStyle#">
								#thistag.generatedContent#
							</html:a>
						</html:td>
					</html:tr>
					</html:table>
				</html:a>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
