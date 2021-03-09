
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />

			<core:HtmlEntityTheme entity="td">
				background-color: ##f0f0f0 ;
				color: #theme.light.onSurface# ;
				font-size: 14px ;
				line-height: 19px ;
				padding: 10px 10px 10px 10px ;
				text-align: center ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="span" class="arrow">
				color: #theme.light.primary# ;
				font-family: helvetica, arial, sans-serif ;
				font-weight: 700 ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="strong">
				color: #theme.light.primary# ;
				text-transform: uppercase ;
			</core:HtmlEntityTheme>
			<!---
				By default, the post-a-reply text will all be on one line. But, on narrow
				devices, we want to split the text across two lines so that we don't end
				up with an "orphaned" word on a second line.
			--->
			<core:MaxWidthStyles width="390">
				.reply-above-line span.narrow-line {
					display: block ;
				}
			</core:MaxWidthStyles>

			<!--- NOTE: Cellpadding needed for older email clients. --->
			<html:table width="100%" cellpadding="10" margins="none" class="reply-above-line">
			<html:tr>
				<html:td>

					<html:span class="narrow-line">
						<html:span class="arrow">&larr;</html:span>
						Write <html:strong>above this line</html:strong> to post
					</html:span>
					<html:span class="narrow-line">
					 	a reply via email.
					 </html:span>

				</html:td>
			</html:tr>
			</html:table>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
