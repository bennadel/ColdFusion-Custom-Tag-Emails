
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./" />
<cfimport prefix="html" taglib="./html/" />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.maxWidth" type="numeric" default="0" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfif isInvalidNested( getBaseTagList() )>

			<cfthrow
				type="UnexpectedTagNesting"
				message="Unexpected nesting of IfDesktopView tag"
				detail="The IfDesktopView tag cannot be nested inside IfDesktopView or IfMobileView."
				extendedInfo="Base tag list: #getBaseTagList()#"
			/>

		</cfif>

	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfset className = "email-if-desktop-view-wrapper" />

			<core:MaxWidthStyles width="#attributes.maxWidth#">
				.#className# {
					display: none ;
				}
			</core:MaxWidthStyles>

			<html:table width="100%" margins="none" class="#className#">
			<html:tr>
				<html:td>
					#thistag.generatedContent#
				</html:td>
			</html:tr>
			</html:table>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I determine if this tag is nested inside another, unexpected tag.
	* 
	* @baseTagList I am the list of parent tags being inspected.
	*/
	public boolean function isInvalidNested( required string baseTagList )
		cachedWithin = "request"
		{

		var parentTags = arguments.baseTagList.listRest( "," ).listToArray();

		return(
			parentTags.containsNoCase( "cf_IfDesktopView" ) ||
			parentTags.containsNoCase( "cf_IfMobileView" )
		);

	}

</cfscript>
