
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

			<cfmodule template="./MaxWidthStyles.cfm" width="#attributes.maxWidth#">
				.email-if-desktop-view-wrapper {
					display: none ;
				}
			</cfmodule>

			<!---
				CAUTION: We are using raw HTML elements here instead of the "html"
				custom tags module so that we don't accidentally apply Theme styles
				to this markup.
			--->
			<table role="presentation" width="100%" border="0" cellspacing="0" cellpadding="0" class="email-if-desktop-view-wrapper">
			<tr>
				<td>
					#thistag.generatedContent#
				</td>
			</tr>
			</table>

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

		var parentTags = listToArray( listRest( arguments.baseTagList ) );

		return(
			arrayContainsNoCase( parentTags, "cf_IfDesktopView" ) ||
			arrayContainsNoCase( parentTags, "cf_IfMobileView" )
		);

	}

</cfscript>
