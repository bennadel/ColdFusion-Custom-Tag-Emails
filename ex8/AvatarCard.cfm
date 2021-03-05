
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.margins" type="string" default="none normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<!---
				Since we're using multi-slot content projection in this ColdFusion custom
				tag, it means that we have to define the possible SLOTS in the START
				execution mode of this tag. These variables can be set with default
				values, which will then be overridden during the child-content rendering.
			--->
			<cfset slots = {
				avatar: "",
				name: "",
				email: ""
			} />

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:HtmlEntityTheme entity="td" class="avatar">
				padding: 0px 10px 0px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="td" class="info">
				padding: 0px 0px 0px 0px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h4" class="name">
				font-size: 18px ;
				line-height: 23px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="p" class="email">
				color: ##999999 ;
				font-size: 16px ;
				line-height: 18px ;
			</core:HtmlEntityTheme>

			<!--- NOTE: Including cellpadding for older email clients. --->
			<html:table align="left" cellpadding="10" margins="#attributes.margins#">
			<html:tr>
				<html:td valign="center" class="avatar">

					#slots.avatar#

				</html:td>
				<html:td valign="center" class="info">

					<html:h4 margins="none quarter" class="name">
						#slots.name#
					</html:h4>

					<html:p margins="none" class="email">
						#slots.email#
					</html:p>

				</html:td>
			</html:tr>
			</html:table>

		</cfoutput>
	</cfcase>
</cfswitch>
