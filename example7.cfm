
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="ex7" taglib="./ex7/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Content projection slots"
	teaser="Making complex layouts easier to reason about!">
	<ex7:Body>

		<html:h1>
			Using content projection slots for layout
		</html:h1>

		<html:p>
			When layouts get more complicated, we can try to keep the HTML simple by
			separating the <html:strong>definition of the content</html:strong> from the
			<html:strong>layout of the content</html:strong>. To do this, we can create
			"slots" that aggregate data into variables that a ColdFusion custom tag can
			then use within an <html:mark>encapsulated layout</html:mark>.
		</html:p>

		<ex7:ImageGrid>
			<!---
				The ImageGrid component serves two purposes: first, it can provide themes
				to the child content; and second, it defines a "slots" object that can be
				used for content project. In this case, all of the image rendering is
				being collected into a multi-slot (Array) called "images". The ImageGrid
				will then use that "images" array to render the underlying TALBE tag(s).
				--
				NOTE: I'm using maths for the height since these are not the natural
				dimensions of the image.
			--->
			<core:Slot name="images" multi="true">
				<html:img
					src="https://bennadel-cdn.com/images/header/photos/jeremiah_lee_2.jpg"
					alt="Ben Nadel and Jeremiah Lee, double-front biceps!"
					width="225"
					height="#round( 225 / 1120 * 570 )#"
				/>
			</core:Slot>
			<core:Slot name="images" multi="true">
				<html:img
					src="https://bennadel-cdn.com/images/header/photos/jeremiah_lee_2.jpg"
					alt="Ben Nadel and Jeremiah Lee, double-front biceps!"
					width="225"
					height="#round( 225 / 1120 * 570 )#"
				/>
			</core:Slot>
			<core:Slot name="images" multi="true">
				<html:img
					src="https://bennadel-cdn.com/images/header/photos/jeremiah_lee_2.jpg"
					alt="Ben Nadel and Jeremiah Lee, double-front biceps!"
					width="225"
					height="#round( 225 / 1120 * 570 )#"
				/>
			</core:Slot>
			<core:Slot name="images" multi="true">
				<html:img
					src="https://bennadel-cdn.com/images/header/photos/jeremiah_lee_2.jpg"
					alt="Ben Nadel and Jeremiah Lee, double-front biceps!"
					width="225"
					height="#round( 225 / 1120 * 570 )#"
				/>
			</core:Slot>
		</ex7:ImageGrid>

		<html:p>
			In this case, the <html:strong>&lt;core:ImageGrid&gt; tag</html:strong> is
			proving both a Desktop and a Mobile view!
		</html:p>

		<html:p>
			Now, the ImageGrid component slots used "multi", which means the slot was
			treated as an Array. But, the default behavior for a slot is just to set a
			single variable value.
		</html:p>

		<!---
			The Links ColdFusion custom tag has two slots: "left" and "right". The
			following Slot tags simply assign the generated content to those values.
		--->
		<ex7:Links>
			<core:Slot name="left">
				<html:a href="https://www.bennadel.com/">BenNadel.com</html:a> &rarr;
			</core:Slot>
			<core:Slot name="right">
				<html:a href="https://www.bennadel.com/people/">People</html:a> &rarr;
			</core:Slot>
		</ex7:Links>

		<html:p margins="none">
			This is gonna be hella sweet, I think!
		</html:p>

	</ex7:Body>
</core:Email>
