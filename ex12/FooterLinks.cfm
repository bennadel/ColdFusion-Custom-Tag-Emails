
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfset email = getBaseTagData( "cf_email" ) />
			<!---
				In order to access the defined providers, I just have to reach up into
				the base "email" tag and grab the Providers struct. The same way I do
				for the theme data.
			--->
			<cfset theme = email.theme />
			<cfset providers = email.providers />

			<core:HtmlEntityTheme entity="p">
				color: ##999999 ;
				font-size: 14px ;
				line-height: 19px ;
				text-align: center ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="a">
				color: ##999999 ;
				padding: 0px 3px 0px 3px ;
			</core:HtmlEntityTheme>
			<core:HeaderStyles>
				.secondary-footer a:hover {
					background-color: #theme.light.primary# ;
					color: ##ffffff ;
				}
			</core:HeaderStyles>

			<html:p margins="normal none" class="secondary-footer">
				<html:a href="#providers.siteUrl#">Ben Nadel</html:a>
				<html:span>&nbsp;|&nbsp;</html:span>
				<html:a href="#providers.aboutUrl#">About</html:a>
				<html:span>&nbsp;|&nbsp;</html:span>
				<html:a href="#providers.peopleUrl#">Amazing People</html:a>
			</html:p>

			<!--- Make sure this tag has NO BODY. --->
			<cfexit method="exitTag" />

		</cfoutput>
	</cfcase>
</cfswitch>
