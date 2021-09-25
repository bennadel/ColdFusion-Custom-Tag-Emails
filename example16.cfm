
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Testing encoded HREF and SRC attributes."
	teaser="Because Yahoo! Mail">
	<core:Body>

		<html:h1>
			Testing encoded HREF and SRC attributes
		</html:h1>

		<html:p>
			It seems that some email clients
			<html:strong>*cough*</html:strong> Yahoo! Mail <html:strong>*cough*</html:strong>
			will strip-out <html:code>href</html:code> attributes if they contain an
			encoded protocol. As such, I've updated the <html:code>&lt;A&gt;</html:code>
			and <html:code>&lt;IMG&gt;</html:code> tags to use some additional logic in
			their rendering to <html:em>un-escape</html:em> both <html:code>href</html:code>
			and <html:code>src</html:code> attributes.
		</html:p>

		<html:h2>
			Some test tags:
		</html:h2>

		<html:p>
			<html:a href="#encodeForHtmlAttribute( 'https://www.bennadel.com/people/who-rock-my-world.htm' )#">A test anchor</html:a>
		</html:p>

		<html:p>
			<html:img
				src="#encodeForHtmlAttribute( 'https://bennadel-cdn.com/images/header/photos/jessica_eisner.jpg' )#"
				width="500"
				height="254"
			/>
		</html:p>

	</core:Body>
</core:Email>
