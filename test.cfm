
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="standard" taglib="./standard-layout/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:email
	subject="You were mentioned on BenNadel.com redsign"
	teaser="Ben Nadel mentioned you in a comment.">

	<standard:Layout>

		<standard:Title>
			Ben Nadel just mentioned you on
			<standard:TitleLink href="https://projects.invisionapp.com/">
				BenNadel.com redsign
			</standard:TitleLink>
		</standard:Title>

		<core:P>
			Hello there, this is my beautiful email!
		</core:P>

		<core:P>
			It was constructed using ColdFusion custom tags rather than a CSS
			build system. The thought here being that CSS in emails is
			<core:Em>hella complicated</core:Em>! And, I'd rather have some less
			robust, but more predicatable output.
		</core:P>

	</standard:Layout>

</core:email>



