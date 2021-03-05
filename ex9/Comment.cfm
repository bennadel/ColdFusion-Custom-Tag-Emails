
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />
<cfimport prefix="ex9" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.commentCreatedAt" type="date" />
<cfparam name="attributes.commentText" type="string" />
<cfparam name="attributes.margins" type="string" default="none 20" />
<cfparam name="attributes.userAvatarUrl" type="string" default="" />
<cfparam name="attributes.userInitials" type="string" />
<cfparam name="attributes.userName" type="string" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:HtmlEntityTheme entity="td" class="avatar-container">
				padding: 0px 13px 0px 5px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="comment-container">
				padding: 0px 10px 0px 0px ;
			</core:HtmlEntityTheme>
			<core:MaxWidthStyles width="400">
				.avatar-container {
					padding: 0px 10px 0px 0px ;
				}

				.comment-container {
					padding: 0px 0px 0px 0px ;
				}
			</core:MaxWidthStyles>
			<core:HtmlEntityTheme entity="h3">
				font-size: 16px ;
				line-height: 22px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="span" class="created-at">
				color: ##999999 ;
				font-weight: 400 ;
			</core:HtmlEntityTheme>
			<core:MaxWidthStyles>
				.created-at {
					display: block ;
					font-size: 14px ;
					line-height: 17px ;
					margin-bottom: 5px ;
					margin-top: 3px ;
				}

				.created-at-dash {
					display: none ;
				}
			</core:MaxWidthStyles>
			<core:HtmlEntityTheme entity="p">
				font-size: 16px ;
				line-height: 22px ;
			</core:HtmlEntityTheme>

			<!--- NOTE: Cellpadding needed for older email clients. --->
			<html:table width="100%" cellpadding="8" margins="#attributes.margins#">
			<html:tr>
				<html:td class="avatar-container">

					<ex9:Avatar
						imageUrl="#attributes.userAvatarUrl#"
						initials="#attributes.userInitials#"
						margins="none"
					/>

				</html:td>
				<html:td width="100%" class="comment-container">

					<html:h3 margins="none half">
						#encodeForHtml( attributes.userName )#

						<html:span class="created-at">
							<html:span class="created-at-dash">&mdash;</html:span>
							#dateFormat( attributes.commentCreatedAt, "mmm d, yyyy" )# at
							#timeFormat( attributes.commentCreatedAt, "h:mm TT" )# (UTC)
						</html:span>
					</html:h3>

					<html:p margins="none">
						#attributes.commentText#
					</html:p>

				</html:td>
			</html:tr>
			</html:table>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
