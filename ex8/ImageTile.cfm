
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.caption" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<!---
				Since we're consuming the generated content of this ColdFusion custom
				tag, it means we can use the START execution mode as a means to define
				custom themeing for the child content. In this case, we're going to
				make sure the embedded IMG tag is BLOCK display; and that it has some
				responsive styles on smaller screens.
			--->
			<core:HtmlEntityTheme entity="img">
				display: block ;
			</core:HtmlEntityTheme>
			<core:MaxWidthStyles>
				.ex8-image-tile img {
					height: auto ;
					width: 100% ;
				}
			</core:MaxWidthStyles>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<core:HtmlEntityTheme entity="td">
				background-color: ##f0f0f0 ;
				border: 1px solid ##cccccc ;
				border-radius: 5px 5px 5px 5px ;
				padding: 10px 10px 10px 10px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="p">
				font-style: italic ;
				font-size: 14px ;
				text-align: center ;
			</core:HtmlEntityTheme>

			<!--- NOTE: Including cellpadding for older email clients. --->
			<html:table align="center" cellpadding="10" margins="#attributes.margins#" class="ex8-image-tile">
			<html:tr>
				<html:td class="html-entity-line-height-reset">

					<!--- PROJECTING the Generated Content into this rendering --->
					#thistag.generatedContent#
					<!--- PROJECTING the Generated Content into this rendering --->

					<cfif len( attributes.caption )>
						
						<html:p margins="half none">
							#encodeForHtml( attributes.caption )#
						</html:p>

					</cfif>

				</html:td>
			</html:tr>
			</html:table>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
