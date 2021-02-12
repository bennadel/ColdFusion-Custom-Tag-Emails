
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.fontSize" type="numeric" default="14" />
<cfparam name="attributes.imageUrl" type="string" default="" />
<cfparam name="attributes.initials" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="none normal" />
<cfparam name="attributes.size" type="numeric" default="36" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<!---
				With attribute-based encapsulation, all the information we need to render
				the Avatar is provided via the Attributes scope. As such, we only need to
				use the START execution mode of the ColdFusion custom tag.
			--->

			<!--- Use the image-based rendering. --->
			<cfif len( attributes.imageUrl )>

				<core:HtmlEntityTheme entity="td">
					height: #attributes.size#px ;
					width: #attributes.size#px ;
				</core:HtmlEntityTheme>
				<core:HtmlEntityTheme entity="img">
					border-radius: #attributes.size#px ;
					display: block ;
					height: #attributes.size#px ;
					width: #attributes.size#px ;
				</core:HtmlEntityTheme>

				<html:table width="#attributes.size#" margins="#attributes.margins#">
				<html:tr>
					<html:td class="html-entity-line-height-reset">

						<html:img
							src="#attributes.imageUrl#"
							width="#attributes.size#"
							height="#attributes.size#"
							alt="#attributes.initials#"
						/>

					</html:td>
				</html:tr>
				</html:table>

			<!--- Use the initials-based, text-only rendering. --->
			<cfelse>

				<core:HtmlEntityTheme entity="td">
					background-color: ##121212 ;
					border-radius: #attributes.size#px ;
					color: ##ffffff ;
					font-size: #attributes.fontSize#px ;
					height: #attributes.size#px ;
					letter-spacing: 1px ;
					line-height: #attributes.fontSize#px ;
					width: #attributes.size#px ;
				</core:HtmlEntityTheme>

				<html:table width="#attributes.size#" margins="#attributes.margins#">
				<html:tr>
					<html:td align="center" valign="center">

						#encodeForHtml( attributes.initials )#

					</html:td>
				</html:tr>
				</html:table>

			</cfif>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
