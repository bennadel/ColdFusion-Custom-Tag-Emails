
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="ex8" taglib="./ex8/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Encapsulation techniques"
	teaser="Exposing APIs and hiding complexity!">

	<!--- Setup default block-margins for a few of the HTML entities. --->
	<core:Provide name="margins.h2" value="half normal" />
	<core:Provide name="margins.hr" value="normal 20" />

	<core:Body>

		<html:h1>
			Quick roundup of encapsulation techniques
		</html:h1>

		<html:hr />

		<html:h2>
			Technique 1: ColdFusion template include
		</html:h2>

		<!---
			Everything we've been looking at lately revolves around ColdFusion Custom
			Tags. However, this is all still "just" ColdFusion. Which means, we can use
			every tool in the tool-belt, including plain-old includes.
		--->
		<cfinclude template="./ex8/description.cfm" />

		<html:hr />

		<html:h2>
			Technique 2: ColdFusion custom tag attributes
		</html:h2>

		<!---
			After a CFInclude, the next most natural concept for ColdFusion Custom Tag
			encapsulation is attribute-based data passing. Here, we have an Avatar tag
			that can either render an image (if given an imageUrl); or, an initials-
			based visual if no image is available.
		--->
		<ex8:Avatar
			imageUrl="https://bennadel-cdn.com/images/global/ben-nadel-avatar.jpg"
			size="42"
		/>

		<ex8:Avatar
			initials="BN"
			size="42"
			fontSize="16"
		/>

		<html:hr />

		<html:h2>
			Technique 3: ColdFusion custom tag generated content
		</html:h2>

		<!---
			Beyond attributes, the next encapsulation technique is to use the generated
			content of the ColdFusion custom tag to wrap the rendering in some additional
			layout. This works really well if the enhanced rendering is fairly
			straightforward. In this case, we're wrapping the given IMG inside a "tile".
			Notice that we can COMBINE the generated content with tag attributes (in this
			case we're passing in the "caption" as an attribute).
		--->
		<ex8:ImageTile caption="Ben Nadel and Dennis Field">
			<html:img
				src="https://bennadel-cdn.com/images/header/photos/dennis_field.jpg"
				width="400"
				height="204"
				alt="Ben Nadel and Dennis Field, thumbs-up style!"
			/>
		</ex8:ImageTile>

		<html:hr />

		<html:h2>
			Technique 4: Multi-slot content projection
		</html:h2>

		<!---
			If the native generated content feature of ColdFusion custom tags isn't
			sufficient, we can use multi-slot content projection. This combines the
			native generated content feature with a special Slot tag in the DSL that
			stores low-level generated content into the parent tag's variables space.
			In this case, we're using three slots to build an Avatar card. And, note
			that all the techniques build on top of each other - one of the Slots
			contains the Avatar encapsulation which uses data-attribute encapsulation.
		--->
		<ex8:AvatarCard>
			<core:Slot name="avatar">
				<ex8:Avatar
					initials="BN"
					size="42"
					fontSize="16"
					margins="none"
				/>
			</core:Slot>
			<core:Slot name="name">
				Ben Nadel
			</core:Slot>
			<core:Slot name="email">
				ben@bennadel.com
			</core:Slot>
		</ex8:AvatarCard>

	</core:Body>
</core:Email>
