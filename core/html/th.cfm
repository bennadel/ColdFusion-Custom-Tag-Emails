
<!--- Define custom tag attributes. --->
<cfparam name="attributes.align" type="string" default="left" />
<cfparam name="attributes.bgcolor" type="string" default="" />
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.colspan" type="string" default="" />
<cfparam name="attributes.rowspan" type="string" default="" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.valign" type="string" default="top" />
<cfparam name="attributes.width" type="string" default="" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			<cfmodule
				template="../Styles.cfm"
				variable="inlineStyle"
				entityName="th"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</cfmodule>

			<!---
				If no bgcolor was passed in, we want to look at the calculated styles to
				see if there is a "background-color" CSS property (long-hand format
				only). If there is, we want to extract that and use it as the bgcolor so
				that the developer doesn't have define background colors twice just for
				older email clients (that support "bgcolor" but not "background-color").
			--->
			<cfif ! len( attributes.bgcolor )>

				<cfset attributes.bgcolor = extractBackgroundColor( inlineStyle ) />

			</cfif>

			<th
				<cfif len( attributes.colspan )>
					colspan="#attributes.colspan#"
				</cfif>
				<cfif len( attributes.rowspan )>
					rowspan="#attributes.rowspan#"
				</cfif>
				<cfif len( attributes.width )>
					width="#attributes.width#"
				</cfif>
				align="#attributes.align#"
				valign="#attributes.valign#"
				<cfif len( attributes.bgcolor )>
					bgcolor="#attributes.bgcolor#"
				</cfif>
				class="#trim( 'html-entity-th #attributes.class#' )#"
				style="#inlineStyle#">
				#thistag.generatedContent#
			</th>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I extract the color hex from the given style block; or, the empty string if there
	* is no "background-color" property.
	* 
	* CAUTION: This only works for long-hand "background-color" properties. And, only for
	* 6-digit hex values.
	* 
	* @styleBlock I am the CSS being inspected.
	*/
	public string function extractBackgroundColor( required string styleBlock )
		cachedWithin = "request"
		{

		var matches = reMatchNoCase( "background-color:\s*##[0-9a-f]{6}\b", arguments.styleBlock );

		if ( arrayLen( matches ) ) {

			return( right( matches[ 1 ], 7 ) );

		} else {

			return( "" );

		}

	}

</cfscript>
