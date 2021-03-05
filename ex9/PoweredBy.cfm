
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<core:HtmlEntityTheme entity="h3">
				color: ##313745 ;
				font-size: 12px ;
				letter-spacing: 0.5px ;
				line-height: 17px ;
				text-align: center ;
				text-transform: uppercase ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="h4">
				color: ##6c7689 ;
				font-size: 12px ;
				font-weight: 300 ;
				line-height: 17px ;
				text-align: center ;
			</core:HtmlEntityTheme>

			<html:h3 margins="normal quarter">
				Powered by InVision
			</html:h3>

			<html:h4 margins="none double">
				The Digital Product Design Platform
			</html:h4>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
