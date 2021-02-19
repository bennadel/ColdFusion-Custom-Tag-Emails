
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Code blocks"
	teaser="Talking nerdy to me!">
	<core:Body>
		<cfoutput>

			<html:h1>
				Sharing code blocks in email
			</html:h1>

			<html:p>
				Let's look at some <html:code>inline code</html:code> samples. Code
				blocks tend to use a monospace font and have a light background color.
				If we're going to include HTML tags in our code, we have to be sure
				to encode the brackets:
				<html:code>#encodeForHtml( "<strong>Cool Beans</strong>" )#</html:code>.
			</html:p>

			<html:p>
				We can also use pre-formatted blocks of code - these are a bit more
				complex, because they use both
				<html:code>#encodeForHtml( "<html:pre>" )#</html:code> and
				<html:code>#encodeForHtml( "<html:code>" )#</html:code> tags and have
				significantly more formatting.
			</html:p>

			<html:pre><html:code>#htmlEditFormat( fileRead( "./ex10/code-sample.txt" ) )#</html:code></html:pre>

			<html:p>
				Easy peasy, lemon squeezey!
			</html:p>

		</cfoutput>
	</core:Body>
</core:Email>
