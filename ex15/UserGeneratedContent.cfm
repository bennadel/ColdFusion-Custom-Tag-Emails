
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="../core/" />
<cfimport prefix="html" taglib="../core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="end">
		<cfoutput>

			#translateHtmlContent( thistag.generatedContent )#

			<!--- Reset the generated content since we're overriding the output. --->
			<cfset thistag.generatedContent = "" />

		</cfoutput>
	</cfcase>
</cfswitch>

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I translate the given USER GENERATED CONTENT (UGC) HTML into the output that would
	* have been generated had the user been using the equivalent DSL tags.
	* 
	* CAUTION: This translation DOES NOT PROVIDE any additional SANITIZATION. All
	* security measures are assumed to have already been taken; and, that the given HTML
	* can be displayed as-is in the case of a parsing error fallback.
	* 
	* @htmlContent I am the user generated content (UGC) to translate.
	*/
	public string function translateHtmlContent( required string htmlContent ) {

		try {

			// To perform the translation, we're going to parse the HTML content into a
			// Document Object Model (DOM) - really just an XML document in this case -
			// and then traverse the DOM in order to REBUILD it using the most relevant
			// DSL tags.
			var bodyNode = htmlParse( htmlContent )
				.search( "//*[ local-name() = 'body' ]" )
			;

			savecontent variable = "local.translatedContent" {

				translateNode( bodyNode.first(), true );

			}

			return( translatedContent );

		} catch ( any error ) {

			// If anything goes wrong in the parsing / translation, just fallback to
			// using the raw content. It may not be formatted as nicely, but it should
			// still render in an HTML email.
			return( htmlContent );

		}

	}


	/**
	* I translate the given DOM (XML) node into a properly formatted HTML string by
	* re-creating it with the most appropriate DSL tags.
	* 
	* CAUTION: Since we are assuming that the user generated content (UGC) has already
	* been run through some sort of sanitization routine (like AntiSammy), we're going to
	* further assume that we are only dealing with a subset of HTML tags which have been
	* allow-listed during processing.
	* 
	* @node I am the DOM node being translated and serialized.
	*/
	public void function translateNode(
		required xml node,
		required boolean allowBottomMargin
		) {

		var tagAttributes = {
			class: "user-generated-content",
			style: ( node.xmlAttributes.style ?: "" )
		};

		if ( node.xmlAttributes.keyExists( "class" ) ) {

			tagAttributes.class &= " #node.xmlAttributes.class#";

		}

		// All default margins on block elements are normalized to use bottom margins
		// only. These defaults are pulled from the email-wide configurations. As such,
		// if we need to suppress a bottom-margin, all we have to do is set the margins
		// to "none" and this will automatically remove the bottom margin.
		if ( ! allowBottomMargin ) {

			tagAttributes.margins = "none";

		}

		// CAUTION: We're using TAG ISLANDS to exert fine-tunes control over whitespace
		// output within our content translation. Notice that some back-ticks are on the
		// same line (for inline elements) and some are new lines (for block elements).
		switch ( node.xmlName ) {
			case "a":

				tagAttributes.href = ( node.xmlAttributes.href ?: "" );

				```<html:a attributeCollection="#tagAttributes#"><cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput></html:a>```

			break;
			case "blockquote":

				```
				<html:blockquote attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes, false )#</cfoutput>
				</html:blockquote>
				```

			break;
			case "body":

				// This is the ROOT container for the user-generated content.
				```
				<core:HtmlEntityTheme entity="td" class="user-generated-content-wrapper">
					border: 1px solid #262626 ;
					padding: 16px 20px 16px 20px ;
				</core:HtmlEntityTheme>

				<html:table width="100%" cellpadding="10">
				<html:tr>
					<html:td class="user-generated-content-wrapper">
						<cfoutput>#translateChildNodes( node.xmlNodes, false )#</cfoutput>
					</html:td>
				</html:tr>
				</html:table>
				```

			break;
			case "code":

				```<html:code attributeCollection="#tagAttributes#"><cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput></html:code>```

			break;
			case "div":

				```
				<html:div attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:div>
				```

			break;
			case "em":
			case "i":

				```<html:em attributeCollection="#tagAttributes#"><cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput></html:em>```

			break;
			case "h1":

				```
				<html:h1 attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:h1>
				```

			break;
			case "h2":

				```
				<html:h2 attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:h2>
				```

			break;
			case "h3":

				```
				<html:h3 attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:h3>
				```

			break;
			case "h4":

				```
				<html:h4 attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:h4>
				```

			break;
			case "h5":

				```
				<html:h5 attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:h5>
				```

			break;
			case "hr":

				```
				<html:hr attributeCollection="#tagAttributes#" />
				```

			break;
			case "li":

				```
				<html:li attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes, false )#</cfoutput>
				</html:li>
				```

			break;
			case "ol":

				```
				<html:ol attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:ol>
				```

			break;
			case "p":

				```
				<html:p attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:p>
				```

			break;
			case "pre":

				```<html:pre attributeCollection="#tagAttributes#"><cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput></html:pre>```

			break;
			case "span":

				```<html:span attributeCollection="#tagAttributes#"><cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput></html:span>```

			break;
			case "strike":

				```<html:strike attributeCollection="#tagAttributes#"><cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput></html:strike>```

			break;
			case "strong":
			case "b":

				```<html:strong attributeCollection="#tagAttributes#"><cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput></html:strong>```

			break;
			case "ul":

				```
				<html:ul attributeCollection="#tagAttributes#">
					<cfoutput>#translateChildNodes( node.xmlNodes )#</cfoutput>
				</html:ul>
				```

			break;
			// If we don't have an equivalent ColdFusion custom tag, just pass-through
			// the given tag as-is. We're going to rely on the email client to be able
			// to render it "good enough".
			default:

				```<cfoutput><#node.xmlName#>#translateChildNodes( node.xmlNodes )#</#node.xmlName#></cfoutput>```

			break;
		}

	}


	/**
	* I translate the given DOM (XML) nodes into a properly formatted HTML string by
	* re-creating them with the most appropriate DSL tags.
	* 
	* @nodes I am the DOM nodes being translated and serialized.
	* @allowLastElementMargin I determine if the last Element node can have a bottom margin.
	*/
	public void function translateChildNodes(
		required array nodes,
		boolean allowLastElementMargin = true
		) {

		var elementCount = getElementCount( nodes );
		var elementIndex = 0;

		for ( var node in nodes ) {

			switch ( node.getNodeType() ) {
				case "TEXT_NODE":

					echo( translateTextNode( node ) );

				break;
				case "ELEMENT_NODE":

					// For element nodes, we need to determine if the given node is the
					// last element in its parent container; and, if so, whether or not
					// it's allowed to have a bottom margin.
					var isLastElement = ( ++elementIndex == elementCount );
					var allowBottomMargin = ( allowLastElementMargin || ! isLastElement );

					echo( translateNode( node, allowBottomMargin ) );

				break;
			}

		}

	}


	/**
	* I translate the given XML text node into plain text.
	* 
	* @node I am the XML node being serialized.
	*/
	public void function translateTextNode( required xml node ) {

		echo( toString( node ).listRest( ">" ) );

	}


	/**
	* I return the count of element-nodes within the given nodes collection.
	* 
	* @nodes I am the collection of XML nodes being inspected.
	*/
	public numeric function getElementCount( required array nodes ) {

		var total = 0;

		for ( var node in nodes ) {

			if ( node.getNodeType() == "ELEMENT_NODE" ) {

				total++;

			}

		}

		return( total );

	}

</cfscript>
