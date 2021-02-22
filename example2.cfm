
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Let's see how we can customize email content!"
	teaser="It's actually kind of neat!">
	<core:Body>

		<!---
			By default, all the "html:" elements will inherit the core entity themes that
			have been defined in the core:Email and core:Body. However, we can create
			local overrides at any level of the ColdFusion Custom Tag DOM using the
			HtmlEntityTheme tags. This tag can target both entity types and class-names
			(though the entity type is required). Custom styles are applied to the PARENT
			context of the HtmlEntityTheme, and any children.
		--->

		<html:h1>
			Customizing email content is fun!
		</html:h1>

		<html:p>
			The above title and is paragraph tag will use the base styles.
		</html:p>

		<html:p>
			<!--- Override the color of this specific paragraph. --->
			<core:HtmlEntityTheme entity="p">
				color: cornflowerblue ;
			</core:HtmlEntityTheme>

			However, this paragraph will use a local overrides, and should show up as
			some sweet, sweet cornflowerblue.
		</html:p>

		<html:p>
			Of course, the HtmlEntityTheme tag in the previous paragraph won't affect the
			text in this paragraph since it has a different parent.
		</html:p>

		<html:div margins="none normal" class="callout">
			<!---
				Override both the parent DIV as well as several of the local entities.
				Notice that you can target multiple elements in a single override.
				--
				NOTE: background-color should normally be done with a table TD or it
				won't show up in all email clients (cough, Outlook, Lotus Notes). But,
				this is just a fun demo.
			--->
			<core:HtmlEntityTheme entity="div" class="callout">
				background-color: #f0f0f0 ;
				padding: 20px ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="p, li">
				color: darkmagenta ;
			</core:HtmlEntityTheme>
			<core:HtmlEntityTheme entity="em, mark, strong">
				color: crimson ;
			</core:HtmlEntityTheme>

			<html:p>
				Notice that I was able to target <html:em>both</html:em>
				<html:strong>P</html:strong> and <html:strong>LI</html:strong>
				tags in a <html:mark>single override</html:mark>.
			</html:p>

			<html:ol margins="none">
				<html:li>
					This should be sweet, sweet magenta!
				</html:li>
				<html:li>
					So cool!
				</html:li>
				<html:li>
					Can't stop, can't stop the beat!
				</html:li>
			</html:ol>
		</html:div>

		<html:div>
			<html:p>
				Of course, none of the overrides above should have messed with content
				that is <html:strong>in</html:strong> <html:em>this</html:em>
				<html:mark>paragraph</html:mark>.
			</html:p>
		</html:div>

		<!---
			We can also cascade Entity Themes, Style blocks, and Inline styles. This
			starts to get more complicated, and should normally be wrapped up in some
			sort of encapsulation.
		--->
		<core:HtmlEntityTheme entity="p" class="cascade">
			color: deeppink ;
		</core:HtmlEntityTheme>
		<core:Styles variable="middleStyles">
			font-size: 30px ;
			line-height: 38px ;
		</core:Styles>
		<core:Styles variable="inlineCascadeStyle" entityStyle="#middleStyles#">
			font-style: italic ;
			text-decoration: line-through ;
		</core:Styles>

		<html:p class="cascade" style="#inlineCascadeStyle#">
			This will have a cascade of styles!
		</html:p>

	</core:Body>
</core:Email>
