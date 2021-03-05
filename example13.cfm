
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Normalizing block-level margins"
	teaser="Keeping space manageable!">

	<!---
		Out of the box, all of the block-level HTML entities have a default "margins"
		value of "none normal"; however, we can customize each entity at a high-level by
		defining a Provide-based override:
	--->
	<core:Provide name="margins.h1" value="none double" />
	<core:Provide name="margins.p" value="none 20" />
	<core:Provide name="margins.ul" value="half 20" />

	<core:Body>

		<html:h1>
			Normalizing block-level margins
		</html:h1>

		<html:p>
			By default, all block-level entities, such as headers and paragraphs, have a
			<html:code>margins</html:code> value of <html:code>none normal</html:code>.
			But, these margins can be overridden using the
			<html:code>&lt;core:Provide&gt;</html:code> tag. Each block-level entity has
			it's own customizable provider:
		</html:p>

		<html:ul>
			<html:li>"margins.blockquote"</html:li>
			<html:li>"margins.h1"</html:li>
			<html:li>"margins.h2"</html:li>
			<html:li>"margins.h3"</html:li>
			<html:li>"margins.h4"</html:li>
			<html:li>"margins.h5"</html:li>
			<html:li>"margins.hr"</html:li>
			<html:li>"margins.ol"</html:li>
			<html:li>"margins.p"</html:li>
			<html:li>"margins.pre"</html:li>
			<html:li>"margins.table"</html:li>
			<html:li>"margins.ul"</html:li>
		</html:ul>

		<html:p>
			Margin tokens can be either "keywords" or pixel values. Supported keywords
			are:
		</html:p>

		<html:ul>
			<html:li>"quarter" <html:symbol>&rarr;</html:symbol> "4px"</html:li>
			<html:li>"half" <html:symbol>&rarr;</html:symbol> "8px"</html:li>
			<html:li>"normal" <html:symbol>&rarr;</html:symbol> "16px"</html:li>
			<html:li>"double" <html:symbol>&rarr;</html:symbol> "32px"</html:li>
		</html:ul>

		<html:p>
			Any, any numeric token will be considered a "px" value. The two types of
			tokens can be mixed-and-matched:
		</html:p>

		<html:ul>
			<html:li>
				<html:code>margins="none normal"</html:code>
			</html:li>
			<html:li>
				<html:code>margins="none double"</html:code>
			</html:li>
			<html:li>
				<html:code>margins="none 20"</html:code>
			</html:li>
			<html:li>
				<html:code>margins="5 normal"</html:code>
			</html:li>
			<html:li>
				<html:code>margins="10 20"</html:code>
			</html:li>
		</html:ul>

		<html:p margins="50 none">
			And, of course, each block-level entity can still have a per-instance margin
			customization right in the markup.
		</html:p>

	</core:Body>
</core:Email>
