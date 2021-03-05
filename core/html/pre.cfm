
<!--- Get default margins for entity. --->
<cfset entityMargins = getBaseTagData( "cf_email" ).providers[ "margins.pre" ] />

<!--- Define custom tag attributes. --->
<cfparam name="attributes.class" type="string" default="" />
<cfparam name="attributes.margins" type="string" default="#entityMargins#" />
<cfparam name="attributes.style" type="string" default="" />
<cfparam name="attributes.tabSize" type="string" default="4" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">
		<cfoutput>

			<!---
				Since the "code" entity has some base styles, we need to unset some of
				them for use in the "pre" tag.
			--->
			<cfmodule template="../HtmlEntityTheme.cfm" entity="code">
				background-color: transparent ;
				border-radius: 0px ;
				display: block ;
				padding: 0px ;
				white-space: pre-wrap ;
				word-break: break-all ;
			</cfmodule>

		</cfoutput>
	</cfcase>
	<cfcase value="end">
		<cfoutput>

			<!---
				When the email content is being rendered, all unnecessary whitespace is
				removed. However, we don't want this to happen in the PRE tag since the
				PRE tag is intended to maintain whitespace. As such, instead of rendering
				the content directly, we're going to store it. Then, we're going to
				replace it back into the body after the email has been minified.
			--->
			<cfset email = getBaseTagData( "cf_email" ) />
			<cfset arrayAppend( email.preContentBlocks, thistag.generatedContent ) />
			<cfset preContentBlockToken = "__PRE:#arrayLen( email.preContentBlocks )#__" />

			<cfmodule
				template="../Styles.cfm"
				variable="tdStyle"
				entityName="pre"
				entityClass="#attributes.class#"
				entityStyle="#attributes.style#">
				tab-size: #attributes.tabSize# ;
			</cfmodule>
			<cfmodule template="../Styles.cfm" variable="nativePreStyle">
				Margin: 0 ; <!--- For Outlook. --->
				margin: 0px ;
				padding: 0px ;
				white-space: pre-wrap ;
				word-break: break-all ;
			</cfmodule>

			<cfmodule template="../BlockMargins.cfm" margins="#attributes.margins#">

				<!---
					CAUTION: We are using raw HTML elements here instead of the "html"
					custom tags module so that we don't accidentally apply Theme styles
					to this markup.
				--->
				<table role="presentation" width="100%" border="0" cellpadding="10" cellspacing="0">
				<tr>
					<td class="#trim( 'html-entity-pre #attributes.class#' )#" style="#tdStyle#">
						<pre style="#nativePreStyle#">#preContentBlockToken#</pre>
					</td>
				</tr>
				</table>

			</cfmodule>

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>
