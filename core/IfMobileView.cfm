
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
				message="Unexpected nesting of IfMobileView tag"
				detail="The IfMobileView tag cannot be nested inside IfDesktopView or IfMobileView."
				extendedInfo="Base tag list: #getBaseTagList()#"
			/>

		</cfif>

	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<cfset theme = getBaseTagData( "cf_email" ).theme />
			<cfset maxWidth = ( attributes.maxWidth ? attributes.maxWidth : theme.width ) />
			<cfset className = "email-if-mobile-view-wrapper" />

			<core:HeaderStyles>
				@media only screen and ( max-width: #maxWidth#px ) {
					.#className# {
						display: block !important ;
						display: table !important ;
						height: auto !important ;
						overflow: visible !important ;
						visibility: visible !important ;
						width: 100% !important ;
					}
				}
			</core:HeaderStyles>

			<core:IfNotMso>

				<html:table width="100%" margins="none" class="#className#" style="display: none ; width: 0px ; height: 0px ; overflow: hidden ; visibility: hidden ;">
				<html:tr>
					<html:td>
						#thistag.generatedContent#
					</html:td>
				</html:tr>
				</html:table>

			</core:IfNotMso>

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

		var parentTags = baseTagList.listRest( "," ).listToArray();

		return(
			parentTags.containsNoCase( "cf_IfDesktopView" ) ||
			parentTags.containsNoCase( "cf_IfMobileView" )
		);

	}

</cfscript>
