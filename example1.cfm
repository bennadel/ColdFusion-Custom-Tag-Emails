
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />
<cfimport prefix="imageGrid" taglib="./customized/image-grid/" />
<cfimport prefix="customized" taglib="./customized/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Ben Nadel has met some amazing people!"
	teaser="See them for yourself!">
	<core:Body>

		<html:h1>
			<core:NoWrapText>Ben Nadel</core:NoWrapText> has met some truly
			<html:a href="https://www.bennadel.com/people" decoration="false">
				amazing people
			</html:a>
		</html:h1>

		<html:p>
			Good morning my beautiful, beautiful friends!
		</html:p>

		<html:p>
			In the midst of the <html:em>stress</html:em> of this global pandemic, it's
			important to <html:strong>remain thankful</html:strong> for all the good
			people that we have in our lives. And, while we can't see our people as much
			as we might like, we can let the memory of them keep us warm.
		</html:p>

		<html:p>
			Here are some of the great people that I've met:
		</html:p>

		<imageGrid:List>
			<imageGrid:Image
				title="Sara Dunnack"
				src="https://bennadel-cdn.com/images/header/photos/sara_dunnack_3.jpg"
			/>
			<imageGrid:Image
				title="Sara Dunnack"
				src="https://bennadel-cdn.com/images/header/photos/sara_dunnack_3.jpg"
			/>
			<imageGrid:Image
				title="Sara Dunnack"
				src="https://bennadel-cdn.com/images/header/photos/sara_dunnack_3.jpg"
			/>
			<imageGrid:Image
				title="Sara Dunnack"
				src="https://bennadel-cdn.com/images/header/photos/sara_dunnack_3.jpg"
			/>
		</imageGrid:List>

		<html:p>
			Oh the memories! To see more wonderful people, check out my People section.
		</html:p>

		<customized:CallToAction href="https://www.bennadel.com/people" margins="normal">
			See More People
		</customized:CallToAction>

		<html:hr margins="double" />

		<html:p>
			The following is just a bunch of random style stuff to experiment with and
			to see how this all renders in email clients.
		</html:p>

		<html:h1>
			Favorite movies
		</html:h1>

		<html:p>
			There are a lot of great movies out there. I like movies across all genres;
			from action, to rom-com, to sci-fi, to drama &mdash; they all have their
			place. But, I have to admit that my <html:em>favorite genres</html:em> are
			definitely <html:strong>Action</html:strong> and
			<html:strong>Romantic Comedies</html:strong>
		</html:p>

		<html:h2>
			Best Meg Ryan movies
		</html:h2>

		<html:p>
			And ... when it comes to Romantic Comedies, there's no one better than Meg
			Ryan. For Years, Ryan was America's sweetheart, delighting audiences and 
			making us swoon in such films as:
		</html:p>

		<html:ul>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0098635/">
					When Harry Met Sally
				</html:a>
				&mdash;
				<html:mark>this is my favorite!</html:mark>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0128853/">
					You've Got Mail
				</html:a>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0108160/">
					Sleepless in Seattle
				</html:a>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0113117/">
					French Kiss
				</html:a>
			</html:li>
		</html:ul>

		<html:h2>
			Great movie quotes
		</html:h2>

		<html:p>
			One of the great features of a <html:em>feature</html:em> film (see what I
			did there) is that they leave you with dynamite quotes that really make you
			think. One of the highly quotable scenes that I've been thinking about a lot
			lately is from Blade Runner.
		</html:p>

		<html:h3>
			Blade Runner (1982)
		</html:h3>

		<html:p>
			In the last scene of this sci-fi classic, Rutger Hauer contemplates existence
			in the final moments of this life:
		</html:p>

		<html:blockquote>
			<html:p margins="none">
				I've seen things you people wouldn't believe. Attack ships on fire off
				the shoulder of Orion. I watched C-beams glitter in the dark near the
				Tannhauser Gate. All those moments will be lost in time, like tears
				in rain.
			</html:p>
		</html:blockquote>

		<html:p>
			Now, in the <html:em>Director's cut</html:em> of the film, that the end of
			it. But, in the general release cut, Harris Ford follow-up with some
			narration that&mdash;in my opinion&mdash; adds a lot of needed color:
		</html:p>

		<html:blockquote>
			<html:p margins="none">
				I don't know why he saved my life. Maybe in those last moments he loved
				life more than he ever had before. Not just his life - anybody's life;
				my life. All he'd wanted were the same answers the rest of us want.
				Where did I come from? Where am I going? How long have I got? All I could
				do was sit there and watch him die.
			</html:p>
		</html:blockquote>

		<html:h2>
			Top 5 Arnold Schwarzenegger movies
		</html:h2>

		<html:p>
			Obviously, no discussion about movies could ever be considered complete if it
			didn't pay homage to the <html:em>master blaster</html:em> himself &mdash;
			<html:mark>Arnold Schwarzenegger</html:mark>. To make sure we cover all of
			our bases, here are my Top 5:
		</html:p>

		<html:ol>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0103064/">
					Terminator 2
				</html:a>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0111503/">
					True Lies
				</html:a>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0100802/">
					Total Recall
				</html:a>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0099938/">
					Kindergarten Copy
				</html:a>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0096320/">
					Twins
				</html:a>
			</html:li>
			<html:li>
				<html:a href="https://www.imdb.com/title/tt0093773/">
					Predator
				</html:a>
				&mdash;
				<html:mark>Because "5" isn't enough!</html:mark>
			</html:li>
		</html:ol>

	</core:Body>
	<core:TrackingPixel src="https://img.spacergif.org/v1/spacer.gif" />
</core:Email>
