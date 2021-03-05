
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="ex9" taglib="./ex9/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Re: [People Photos] Ben and Joel [1]"
	teaser="Ben Nadel left a comment">
	<!---
		Instead of having the base styles in the BODY tag, I'm going to pull them out
		into a theme-specific include. This way, it makes it a bit more obvious as to
		where the possible class-names are coming from.
		--
		NOTE: We could have more than one include here. I imagine it might be nice to
		have a "base" theme file and then a "comments" theme file after that (for styles
		very specific to THIS email).
	--->
	<cfinclude template="./ex9/theme.cfm" />
	<ex9:Body>

		<html:h1>
			Ben Nadel just commented on
			<html:a href="https://www.invisionapp.com/" decoration="false">People Photos</html:a>
		</html:h1>

		<ex9:CommentCallout>
			<html:a href="https://www.invisionapp.com/" class="thumbnail-link">
				<html:img
					src="https://bennadel-cdn.com/images/header/photos/joel_hill_3.jpg"
					width="477"
					height="243"
					class="thumbnail"
				/>
			</html:a>

			<ex9:Comment
				userName="Ben Nadel"
				userInitials="BN"
				userAvatarUrl="https://bennadel-cdn.com/images/global/ben-nadel-avatar.jpg"
				commentCreatedAt="2021-02-12 06:45:29"
				commentText="I tried to play with the contrast a bit, but it's stil not perfect. That said, I think it's good enough for now. Agreed?"
				margins="normal none"
			/>
		</ex9:CommentCallout>

		<ex9:CallToAction href="https://www.invisionapp.com/" margins="none normal">
			View comment
		</ex9:CallToAction>

		<html:p class="cta-reply-option">
			<html:span class="cta-reply-option-arrow">&larr;</html:span>
			or just reply to this email
		</html:p>

		<html:hr margins="normal double" />

		<html:h2>
			Re: Ben and Joel
		</html:h2>

		<ex9:Comment
			userName="Ben Nadel"
			userInitials="BN"
			userAvatarUrl="https://bennadel-cdn.com/images/global/ben-nadel-avatar.jpg"
			commentCreatedAt="2021-02-10 18:34:20"
			commentText="Good sir, I finally got around to preparing all the conference photos. I'm still getting used ot taking photos with the iPhone. I'm struggling a bit with the color correction and the contrast. What do you think so far?"
		/>

		<ex9:Comment
			userName="Joel Hill"
			userInitials="JH"
			commentCreatedAt="2021-02-10 20:58:17"
			commentText="First off, it was great to see you again! That said, this photo is looking a bit washed-out to me. Maybe can you try increasing the contrast?"
		/>

		<ex9:Comment
			userName="Ben Nadel"
			userInitials="BN"
			userAvatarUrl="https://bennadel-cdn.com/images/global/ben-nadel-avatar.jpg"
			commentCreatedAt="2021-02-12 06:45:29"
			commentText="I tried to play with the contrast a bit, but it's stil not perfect. That said, I think it's good enough for now. Agreed?"
			margins="none"
		/>

	</ex9:Body>
</core:Email>
