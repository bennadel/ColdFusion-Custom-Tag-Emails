
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Let's swap desktop and mobile content"
	teaser="Different constraints, different strategies">
	<core:Body>

		<html:h1>
			Playing with dynamic layouts
		</html:h1>

		<html:p>
			Some layouts make sense on all devices; some layouts make sense on a
			desktop device; and, some layouts only make sense on a mobile device.
			Let's try to swap views based on the device
			(ie, the <html:strong>screen-width</html:strong>).
		</html:p>

		<core:IfDesktopView>

			<html:p style="color: royalblue ;">
				This paragraph should only show on a desktop device (ie,
				<html:strong>wide screens</html:strong>); but, should be invisible
				to mobile devices (ie, narrow screens). At least, that's the plan.
			</html:p>

		</core:IfDesktopView>

		<core:IfMobileView>

			<!---
				NOTE: Since themes get applied to any parent context that is a
				ColdFusion custom tag, we can even leverage the IfMobileView as a
				"container" that can provide local theme overrides to entities.
			--->
			<core:HtmlEntityTheme entity="strong">
				color: purple ;
				background-color: yellow ;
				font-variant: small-caps ;
			</core:HtmlEntityTheme>

			<html:p style="color: deeppink ;">
				This paragraph should only show on a mobile device (ie,
				<html:strong>narrow / responsive screens</html:strong>); but, should
				be invisible to desktop devices (ie, wide screens). At least, that's
				the plan.
			</html:p>

		</core:IfMobileView>

		<html:p>
			And, of course, some content is so simple that it <html:strong>easily
			scales on all devices</html:strong> and doesn't need to be wrapped in
			anything dynamic.
		</html:p>

	</core:Body>
</core:Email>
