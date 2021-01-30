
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

			<core:Styles variable="wrapperStyle">
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

			<p aria-hidden="true" style="#wrapperStyle#">
				<img
					src="#encodeForHtmlAttribute( attributes.src )#"
					width="1"
					height="1"
					alt="#encodeForHtmlAttribute( attributes.alt )#"
					style="#imageStyle#"
				/>
			</p>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
