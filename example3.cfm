
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />
<cfimport prefix="customized" taglib="./customized/callouts/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Let's see how we can customize email content!"
	teaser="It's actually kind of neat!">
	<core:Body>

		<html:h1>
			Customizing email content is fun!
		</html:h1>

		<html:p>
			The above title and is paragraph tag will use the base styles.
		</html:p>

		<customized:Gray>
			<!---
				The Gray callout is a customized ColdFusion Custom Tag widget that the
				developer would author. The Gray callout would take care of defining the
				overrides for the HTML entities within this box using the same mechanics
				we saw with the other examples.
			--->
			<html:h3 margins="none normal">
				This title will be centered
			</html:h3>

			<html:p>
				This will smaller.
			</html:p>

			<html:p margins="none" class="special">
				This will smaller <html:em>and</html:em> hotpink!
			</html:p>
		</customized:Gray>

		<html:p>
			And, none of the Gray-callout styles will leak out to this paragraph.
		</html:p>

	</core:Body>
</core:Email>
