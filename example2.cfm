
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />
<cfimport prefix="callouts" taglib="./standard-layout/callouts/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Ben Nadel has met some amazing people!"
	teaser="See them for yourself!">
	<core:Body>

		<html:h1 margins="none large">
			Ben Nadel has met some truly
			<html:a href="https://www.bennadel.com/people" decoration="false">
				amazing people
			</html:a>
		</html:h1>

		<html:p>
			Good morning my <html:strong class="foo">beautiful, beautiful</html:strong> friends!
		</html:p>

		<callouts:Gray>

			<html:h2 margins="none normal">
				This is a special section
			</html:h2>

			<html:p margins="none">
				Cool things will <html:a href="https://www.bennadel.com">happen here</html:a>!
			</html:p>

		</callouts:Gray>

		<html:h2 margins="none normal">
			This is outside any special sections
		</html:h2>

		<html:h2 class="secondo">
			This is outside any special sections
		</html:h2>

		<html:p>
			It's just <html:em style="color: cyan;">business</html:em> as usual.
		</html:p>

		<html:blockquote>
			Ass sphincter says, What?
		</html:blockquote>

		<html:p>
			<html:a href="https://www.bennadel.com/people">
				<html:img
					src="https://bennadel-cdn.com/images/header/photos/brian_swartzfager_simon_free_jason_dean_jim_priest_vicky_ryder_dan_wilson.jpg"
					width="300"
				/>
			</html:a>
		</html:p>

	</core:Body>
</core:Email>

