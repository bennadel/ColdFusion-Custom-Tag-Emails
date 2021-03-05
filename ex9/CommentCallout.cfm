
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:HtmlEntityTheme entity="a" class="thumbnail-link">
				display: block ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="img" class="thumbnail">
				display: block ;
			</core:HtmlEntityTheme>
			<core:MaxWidthStyles>
				.comment-callout-body img.thumbnail {
					height: auto ;
					width: 100% ;
				}
			</core:MaxWidthStyles>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:HtmlEntityTheme entity="td" class="comment-callout-body">
				border: 1px solid ##ebecee ;
				border-radius: 3px 3px 3px 3px ;
				padding: 8px 8px 8px 8px ;
			</core:HtmlEntityTheme>

			<!--- NOTE: Cellpadding needed for older email clients. --->
			<html:table width="100%" cellpadding="8" margins="none double" class="comment-callout">
			<html:tr>
				<html:td class="comment-callout-body html-entity-line-height-reset">

					#thistag.generatedContent#

				</html:td>
			</html:tr>
			</html:table>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
