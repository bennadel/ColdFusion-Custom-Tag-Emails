<!---
	CAUTION: For INLINE ELEMENTS, we have to be fanatical in the way that we manage the
	output of the ColdFusion custom tag since we don't want to inadvertently add any
	leading or trailing whitespace around the tag content. As such, we're going to wrap
	the output in a custom tag that will trim the output.
---><cfmodule template="../TrimOutput.cfm">

<!--- Define custom tag attributes. --->
<cfparam name="attributes.align" type="string" default="" />
<cfparam name="attributes.alt" type="string" default="" />
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.height" type="string" />
<cfparam name="attributes.src" type="string" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.width" type="string" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<cfmodule
				template="../Styles.cfm"
				variable="inlineStyle"
				entityName="img"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
			</cfmodule>

			<img
				src="#attributes.src#"
				<cfif len( attributes.alt )>
					alt="#attributes.alt#"
				</cfif>
				<cfif len( attributes.width )>
					width="#attributes.width#"
				</cfif>
				<cfif len( attributes.height )>
					height="#attributes.height#"
				</cfif>
				<cfif len( attributes.align )>
					align="#attributes.align#"
				</cfif>
				loading="lazy"
				class="#trim( 'html-entity-img #attributes.class#' )#"
				style="#inlineStyle#"
			/>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- End of fanatical whitespace management. --->
</cfmodule><cfexit method="exitTemplate" />
