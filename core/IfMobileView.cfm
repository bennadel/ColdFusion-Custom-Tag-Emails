
<!--- Define custom tag attributes. --->
<cfparam name="attributes.maxWidth" type="numeric" default="0" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfif isInvalidNested( getBaseTagList() )>

			<cfthrow
				type="UnexpectedTagNesting"
				message="Unexpected nesting of IfMobileView tag"
				detail="The IfMobileView tag cannot be nested inside IfDesktopView or IfMobileView."
				extendedInfo="Base tag list: #getBaseTagList()#"
			/>

		</cfif>

	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfmodule template="./Styles.cfm" variable="tableStyles">
				display: none ;
				height: 0px ;
				mso-hide: all ;
				overflow: hidden ;
				visibility: hidden ;
				width: 0px ;
			</cfmodule>

			<cfmodule template="./MaxWidthStyles.cfm" width="#attributes.maxWidth#">
				.email-if-mobile-view-wrapper {
					display: block ;
					display: table ;
					height: auto ;
					overflow: visible ;
					visibility: visible ;
					width: 100% ;
				}
			</cfmodule>

			<cfmodule template="./IfNotMso.cfm">

				<!---
					CAUTION: We are using raw HTML elements here instead of the "html"
					custom tags module so that we don't accidentally apply Theme styles
					to this markup.
				--->
				<table role="presentation" width="100%" border="0" cellspacing="0" cellpadding="0" class="email-if-mobile-view-wrapper" style="#tableStyles#">
				<tr>
					<td>
						#thistag.generatedContent#
					</td>
				</tr>
				</table>

			</cfmodule>

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
