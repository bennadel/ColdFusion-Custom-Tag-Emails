
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />
<cfimport prefix="ex12" taglib="./ex12/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Providing values"
	teaser="Borrowing more inversion of control ideas from Angular!">

	<!---
		The Provide tag sets up key-value pairs that are accessible to other ColdFusion
		custom tags in the Email. This is just another way to provide data to lower-level
		rendering abstractions. This approach will be useful for deeply-nested tags that
		would otherwise require "prop drilling" in order to get data down several layers
		of rendering. For example:

		<ex12:Body> => <ex12:FooterLinks> => <html:a>

		In order to get URLs down to the "footer links" component WITHOUT having to first
		provide them to the "body" component as an intermediary, we can "provide" them
		and then the "footer links" component can just reach for them directly.
	--->
	<core:Provide name="siteUrl" value="https://www.bennadel.com/" />
	<core:Provide name="aboutUrl" value="https://www.bennadel.com/about" />
	<core:Provide name="peopleUrl" value="https://www.bennadel.com/people" />

	<ex12:Body>

		<html:h1>
			Providing deep values
		</html:h1>

		<html:p>
			In <html:mark>Example 8</html:mark>, we looked at various ways to encapsulate
			rendering details:
		</html:p>

		<html:ul>
			<html:li>Using CFInclude.</html:li>
			<html:li>Using tag attributes.</html:li>
			<html:li>Using tag generated content.</html:li>
			<html:li>Using multi-slot projection.</html:li>
		</html:ul>

		<html:p>
			Now, I'd like to borrow <html:em>yet another</html:em> idea from Angular:
			<html:mark>Providers</html:mark>. A provider just creates a key-value pair
			that is subsequently accessible to every other ColdFusion custom tag in
			the email rendering.
		</html:p>

	</ex12:Body>
</core:Email>
