
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="ex6" taglib="./ex6/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Playing with media queries"
	teaser="Seeing if dark mode works.">
	<ex6:Body>

		<html:h1>
			Trying to formulate ideas around dark mode.
		</html:h1>

		<html:blockquote>
			<html:p>
				Our deepest fear is not that we are inadequate. Our deepest fear is
				that we are powerful beyond measure. It is our light, not our darkness,
				that most frightens us. Your playing small does not serve the world.
				There is nothing enlightened about shrinking so that other people won't
				feel insecure around you. We are all meant to shine as children do. It's
				not just in some of us; it is in everyone. And as we let our own lights
				shine, we unconsciously give other people permission to do the same. As
				we are liberated from our own fear, our presence automatically liberates
				others.
			</html:p>
		</html:blockquote>

		<html:p>
			&mdash; <html:strong>Marianne Williamson</html:strong>
		</html:p>

	</ex6:Body>
</core:Email>
