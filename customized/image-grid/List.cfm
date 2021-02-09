
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../../core/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margins" type="string" default="none normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset images = [] />

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<cfset horizontalTableClass = "c-#createUniqueId()#" />
			<cfset verticalTableClass = "c-#createUniqueId()#" />

			<core:HeaderStyles>
				@media only screen and ( max-width: #theme.width#px ) {

					.#horizontalTableClass# {
						display: none !important ;
					}

					.#verticalTableClass# {
						display: block !important ;
					}

				}
			</core:HeaderStyles>

			<core:BlockMargins margins="#attributes.margins#">

				<!---
					CAUTION: Display:None only seems to be supported in Outlook when applied
					to a TABLE. It does not seem to work on other elements.
				--->

				<!--- HORIZONTAL layout (rendered by default). --->
				<table width="100%" border="0" cellspacing="0" cellpadding="10" class="#horizontalTableClass#">
				<cfloop index="i" from="1" to="#images.len()#" step="2">
					<tr>
						<td width="50%" align="center">
							<img
								src="#images[ i ].src#"
								alt="#encodeForHtmlAttribute( images[ i ].title )#"
								width="244"
								height="124"
							/>
						</td>
						<td width="50%" align="center">
							<img
								src="#images[ i + 1 ].src#"
								alt="#encodeForHtmlAttribute( images[ i + 1 ].title )#"
								width="244"
								height="124"
							/>
						</td>
					</tr>
				</cfloop>
				</table>

				<!--- VERTICAL layout (hidden by default). --->
				<table width="100%" border="0" cellspacing="0" cellpadding="10" class="#verticalTableClass#" style="display: none ;">
				<cfloop value="image" array="#images#">
					<tr>
						<td>
							<img
								src="#image.src#"
								alt="#encodeForHtmlAttribute( image.title )#"
								style="width: 100% ;"
							/>
						</td>
					</tr>
				</cfloop>
				</table>

			</core:BlockMargins>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
