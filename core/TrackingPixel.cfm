
<!--- Define custom tag attributes. --->
<cfparam name="attributes.src" type="string" />
<cfparam name="attributes.alt" type="string" default="This pixel helps us understand our customer's consumption of email content." />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfmodule template="./Styles.cfm" variable="paragraphStyle">
				font-size: 1px ;
				height: 1px ;
				line-height: 1px ;
				mso-line-height-rule: exactly ;
				overflow: hidden ;
			</cfmodule>
			<cfmodule template="./Styles.cfm" variable="imageStyle">
				height: 1px ;
				width: 1px ;
			</cfmodule>
			<!--- Trying to make sure that the email client doesn't mess with this. --->
			<cfmodule template="./MaxWidthStyles.cfm">
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
			</cfmodule>

			<!---
				CAUTION: We are using raw HTML elements here instead of the "html"
				custom tags module so that we don't accidentally apply Theme styles
				to this markup.
			--->
			<p aria-hidden="true" class="email-tracking-pixel" style="#paragraphStyle#">
				<img
					src="#fixProtocol( encodeForHtmlAttribute( attributes.src ) )#"
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

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I unencode the protocol contained within the given attribute. Some email clients,
	* like Yahoo! Mail, will strip-out the HREF attribute if it contains an encoded
	* protocol. As a measure of abundant caution, I am therefore applying the same fixing
	* logic to the SRC attributes (which also contain URLs).
	* 
	* @encodedAttribute I am the SRC value being "fixed".
	*/
	public string function fixProtocol( required string encodedAttribute ) {

		var unencodedSuffix = "://";
		var encodedSuffix = encodeForHtmlAttribute( unencodedSuffix );

		return(
			reReplaceNoCase(
				arguments.encodedAttribute,
				"^([a-z0-9]+)#encodedSuffix#",
				"\1#unencodedSuffix#",
				"one"
			)
		);

	}

</cfscript>
