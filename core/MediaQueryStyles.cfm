
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.name" type="string" />
<cfparam name="attributes.value" type="string" />
<cfparam name="attributes.injectImportant" type="boolean" default="true" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<core:HeaderStyles>
				@media only screen and ( #attributes.name#: #attributes.value# ) {

					#prepareStyles( thistag.generatedContent, attributes.injectImportant )#

				}
			</core:HeaderStyles>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I (optionally) inject the "!important" flag at the end of each CSS property line,
	* using the semi-colon as a hook into the placement.
	* 
	* @content I am the style content being augmented.
	*/
	public string function prepareStyles(
		required string content,
		required boolean injectImportLineFlag
		)
		cachedWithin = "request"
		{

		if ( ! injectImportLineFlag ) {

			return( content );

		}

		if ( content.findNoCase( "!important" ) ) {

			throw(
				type = "UnexpectedImportant",
				message = "MediaQueryStyles cannot contain !important if it is also being injected.",
				extendedInfo = "Content: #content#"
			);

		}

		return( content.reReplace( "(?m)(;[ \t]*$)", " !important \1", "all" ) );

	}

</cfscript>
