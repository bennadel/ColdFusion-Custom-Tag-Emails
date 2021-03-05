
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset slots = {
				images: []
			} />

			<core:HtmlEntityTheme entity="img">
				border-radius: 4px 4px 4px 4px ;
			</core:HtmlEntityTheme>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:HtmlEntityTheme entity="td">
				padding: 7px 7px 7px 7px ;
			</core:HtmlEntityTheme>

			<core:IfDesktopView>

				<html:table width="100%">
				<html:tr>
					<html:td align="center" class="html-entity-line-height-reset">
						#slots.images[ 1 ]#
					</html:td>
					<html:td align="center" class="html-entity-line-height-reset">
						#slots.images[ 2 ]#
					</html:td>
				</html:tr>
				<html:tr>
					<html:td align="center" class="html-entity-line-height-reset">
						#slots.images[ 3 ]#
					</html:td>
					<html:td align="center" class="html-entity-line-height-reset">
						#slots.images[ 4 ]#
					</html:td>
				</html:tr>
				</html:table>

			</core:IfDesktopView>

			<core:IfMobileView>

				<core:MaxWidthStyles>
					.ex7-image-grid img {
						height: auto ;
						width: 100% ;
					}
				</core:MaxWidthStyles>

				<html:table width="100%" class="ex7-image-grid">
				<html:tr>
					<html:td align="center img-line-height-reset">
						#slots.images[ 1 ]#
					</html:td>
				</html:tr>
				<html:tr>
					<html:td align="center img-line-height-reset">
						#slots.images[ 2 ]#
					</html:td>
				</html:tr>
				<html:tr>
					<html:td align="center img-line-height-reset">
						#slots.images[ 3 ]#
					</html:td>
				</html:tr>
				<html:tr>
					<html:td align="center img-line-height-reset">
						#slots.images[ 4 ]#
					</html:td>
				</html:tr>
				</html:table>

			</core:IfMobileView>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
