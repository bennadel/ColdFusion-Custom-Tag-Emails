<!---
	CAUTION: For INLINE ELEMENTS, we have to be fanatical in the way that we manage the
	output of the ColdFusion custom tag since we don't want to inadvertently add any
	leading or trailing whitespace around the tag content. As such, we're going to wrap
	the output in a custom tag that will trim the output.
---><cfmodule template="../TrimOutput.cfm">

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.href" type="string" />
<cfparam name="attributes.decoration" type="boolean" default="true" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.target" type="string" default="_blank" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfmodule
				template="../Styles.cfm"
				variable="inlineStyle"
				entityName="a"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				<cfif ! attributes.decoration>
					text-decoration: none ;
				</cfif>
			</cfmodule>

			<a
				href="#fixProtocol( attributes.href )#"
				target="#attributes.target#"
				class="#trim( 'html-entity-a #attributes.class#' )#"
				style="#inlineStyle#"
				>#thistag.generatedContent#</a>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- End of fanatical whitespace management. --->
</cfmodule><cfexit method="exitTemplate" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I unencode the protocol contained within the given attribute. Some email clients,
	* like Yahoo! Mail, will strip-out the HREF attribute if it contains an encoded
	* protocol.
	* 
	* @encodedAttribute I am the HREF value being "fixed".
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
