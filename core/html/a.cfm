
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.href" type="string" />
<cfparam name="attributes.decoration" type="boolean" default="true" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:Styles variable="style">
				color: #getBaseTagData( "cf_email" ).coreLinkColor# ;

				<cfif attributes.decoration>
					border-bottom: 1px solid ##ff3366 ;
					text-decoration: none;
				<cfelse>
					text-decoration: none;
				</cfif>
			</core:Styles>

			<a href="#attributes.href#" target="_blank" style="#style#">#thistag.generatedContent#</a>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
