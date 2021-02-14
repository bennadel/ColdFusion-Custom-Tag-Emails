
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.src" type="string" />
<cfparam name="attributes.alt" type="string" default="This pixel helps us understand our customer's consumption of email content." />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:Styles variable="paragraphStyle">
				font-size: 1px ;
				height: 1px ;
				line-height: 1px ;
				mso-line-height-rule: exactly ;
				overflow: hidden ;
			</core:Styles>
			<core:Styles variable="imageStyle">
				height: 1px ;
				width: 1px ;
			</core:Styles>
			<!--- Trying to make sure that the email client doesn't mess with this. --->
			<core:MaxWidthStyles>
				.email-tracking-pixel {
					font-size: 1px ;
					height: 1px ;
					line-height: 1px ;
					mso-line-height-rule: exactly ;
					overflow: hidden ;
				}

				.email-tracking-pixel img {
					height: 1px ;
					width: 1px ;
				}
			</core:MaxWidthStyles>

			<!---
				CAUTION: We are using raw HTML elements here instead of the "html"
				custom tags module so that we don't accidentally apply Theme styles
				to this markup.
			--->
			<p aria-hidden="true" class="email-tracking-pixel" style="#paragraphStyle#">
				<img
					src="#encodeForHtmlAttribute( attributes.src )#"
					width="1"
					height="1"
					alt="#encodeForHtmlAttribute( attributes.alt )#"
					class="email-tracking-pixel-image"
					style="#imageStyle#"
				/>
			</p>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
