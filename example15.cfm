
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />
<cfimport prefix="ex15" taglib="./ex15/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Integrating user-generated content"
	teaser="Yikes!">
	<core:Body>

		<html:h1>
			Integrating user-generated content
		</html:h1>

		<html:p>
			This ColdFusion custom tag DSL depends on the use of <html:strong>custom tags</html:strong>
			instead of <html:strong>raw HTML tags</html:strong> in order to generate email-friendly
			markup and styling. As such, integrating user-generated content alongside our
			DSL is a bit challenging.
		</html:p>

		<!---
			Note that the following block of HTML markup is just that - HTML - not the
			custom tags DSL. But, the "UserGeneratedContent" tag will transpile the HTML
			content into DSL content and output the results.
		--->
		<ex15:UserGeneratedContent>

			<p>
				Hey, I <em>really like</em> this article. But, have you seen this other
				article on the same topic: <a href="https://www.bennadel.com/">Some cool things</a>.
				I particularly liked this quote:
			</p>

			<blockquote>
				<p>
					Guess what?
				</p>
				<p>
					Chicken butt!
				</p>
			</blockquote>

			<h3>
				Some other interesting points:
			</h3>

			<ul>
				<li>This thing</li>
				<li>That thing</li>
				<li>The other thing</li>
			</ul>

			<h4>
				A cool <code>code</code> snippet:
			</h4>

			<pre><code language="text">This is some code!

Code is fun!</code></pre>

		</ex15:UserGeneratedContent>

		<html:p>
			This is going to be interesting.
		</html:p>

	</core:Body>
</core:Email>
