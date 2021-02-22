
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="HTML Entites"
	teaser="When you have unicode you don't need images!">
	<core:Body>

		<html:h1>
			Playing with HTML entity symbols
		</html:h1>

		<html:p>
			I am not sure if this is even <html:strong>worthwhile</html:strong>; but,
			I wanted to create a <html:code>symbol</html:code> tag so that HTML
			entities would have a consistent <html:strong>font-family</html:strong>
			and <html:strong>font-weight</html:strong> across the various clients.
			These are all using:
		</html:p>

		<html:pre><html:code
>font-family: arial, sans-serif ;
font-weight: 400 ;</html:code></html:pre>

		<html:p>
			<core:HtmlEntityTheme entity="p">
				font-size: 40px ;
				letter-spacing: 5px ;
				line-height: 55px ;
			</core:HtmlEntityTheme>

			<!---
				I grabbed these "Arrow" symbols from the W3Schools website:
				https://www.w3schools.com/charsets/ref_utf_arrows.asp
			--->
			<html:symbol>&#8592;</html:symbol> <!--- Leftwards arrow. --->
			<html:symbol>&#8593;</html:symbol> <!--- Upwards arrow. --->
			<html:symbol>&#8594;</html:symbol> <!--- Rightwards arrow. --->
			<html:symbol>&#8595;</html:symbol> <!--- Downwards arrow. --->
			<html:symbol>&#8596;</html:symbol> <!--- Left right arrow. --->
			<html:symbol>&#8597;</html:symbol> <!--- Up down arrow. --->
			<html:symbol>&#8598;</html:symbol> <!--- North west arrow. --->
			<html:symbol>&#8599;</html:symbol> <!--- North east arrow. --->
			<html:symbol>&#8600;</html:symbol> <!--- South east arrow. --->
			<html:symbol>&#8601;</html:symbol> <!--- South west arrow. --->
			<html:symbol>&#8602;</html:symbol> <!--- Leftwards arrow with stroke. --->
			<html:symbol>&#8603;</html:symbol> <!--- Rightwards arrow with stroke. --->
			<html:symbol>&#8604;</html:symbol> <!--- Leftwards wave arrow. --->
			<html:symbol>&#8605;</html:symbol> <!--- Rightwards wave arrow. --->
			<html:symbol>&#8606;</html:symbol> <!--- Leftwards two headed arrow. --->
			<html:symbol>&#8607;</html:symbol> <!--- Upwards two headed arrow. --->
			<html:symbol>&#8608;</html:symbol> <!--- Rightwards two headed arrow. --->
			<html:symbol>&#8609;</html:symbol> <!--- Downwards two headed arrow. --->
			<html:symbol>&#8610;</html:symbol> <!--- Leftwards arrow with tail. --->
			<html:symbol>&#8611;</html:symbol> <!--- Rightwards arrow with tail. --->
			<html:symbol>&#8612;</html:symbol> <!--- Leftwards arrow from bar. --->
			<html:symbol>&#8613;</html:symbol> <!--- Upwards arrow from bar. --->
			<html:symbol>&#8614;</html:symbol> <!--- Rightwards arrow from bar. --->
			<html:symbol>&#8615;</html:symbol> <!--- Downwards arrow from bar. --->
			<html:symbol>&#8616;</html:symbol> <!--- Up down arrow with base. --->
			<html:symbol>&#8617;</html:symbol> <!--- Leftwards arrow with hook. --->
			<html:symbol>&#8618;</html:symbol> <!--- Rightwards arrow with hook. --->
			<html:symbol>&#8619;</html:symbol> <!--- Leftwards arrow with loop. --->
			<html:symbol>&#8620;</html:symbol> <!--- Rightwards arrow with loop. --->
			<html:symbol>&#8621;</html:symbol> <!--- Left right wave arrow. --->
			<html:symbol>&#8622;</html:symbol> <!--- Left right arrow with stroke. --->
			<html:symbol>&#8623;</html:symbol> <!--- Downwards zigzag arrow. --->
			<html:symbol>&#8624;</html:symbol> <!--- Upwards arrow with tip leftwards. --->
			<html:symbol>&#8625;</html:symbol> <!--- Upwards arrow with tip rightwards. --->
			<html:symbol>&#8626;</html:symbol> <!--- Downwards arrow with tip leftwards. --->
			<html:symbol>&#8627;</html:symbol> <!--- Downwards arrow with tip rightwards. --->
			<html:symbol>&#8628;</html:symbol> <!--- Rightwards arrow with corner downwards. --->
			<html:symbol>&#8629;</html:symbol> <!--- Downwards arrow with corner leftwards. --->
			<html:symbol>&#8630;</html:symbol> <!--- Anticlockwise top semicircle arrow. --->
			<html:symbol>&#8631;</html:symbol> <!--- Clockwise top semicircle arrow. --->
			<html:symbol>&#8632;</html:symbol> <!--- North west arrow to long bar. --->
			<html:symbol>&#8633;</html:symbol> <!--- Leftwards arrow to bar over rightwards arrow to bar. --->
			<html:symbol>&#8634;</html:symbol> <!--- Anticlockwise open circle arrow. --->
			<html:symbol>&#8635;</html:symbol> <!--- Clockwise open circle arrow. --->
			<html:symbol>&#8636;</html:symbol> <!--- Leftwards harpoon with barb upwards. --->
			<html:symbol>&#8637;</html:symbol> <!--- Leftwards harpoon with barb downwards. --->
			<html:symbol>&#8638;</html:symbol> <!--- Upwards harpoon with barb rightwards. --->
			<html:symbol>&#8639;</html:symbol> <!--- Upwards harpoon with barb leftwards. --->
			<html:symbol>&#8640;</html:symbol> <!--- Rightwards harpoon with barb upwards. --->
			<html:symbol>&#8641;</html:symbol> <!--- Rightwards harpoon with barb downwards. --->
			<html:symbol>&#8642;</html:symbol> <!--- Downwards harpoon with barb rightwards. --->
			<html:symbol>&#8643;</html:symbol> <!--- Downwards harpoon with barb leftwards. --->
			<html:symbol>&#8644;</html:symbol> <!--- Rightwards arrow over leftwards arrow. --->
			<html:symbol>&#8645;</html:symbol> <!--- Upwards arrow leftwards of downwards arrow. --->
			<html:symbol>&#8646;</html:symbol> <!--- Leftwards arrow over rightwards arrow. --->
			<html:symbol>&#8647;</html:symbol> <!--- Leftwards paired arrows. --->
			<html:symbol>&#8648;</html:symbol> <!--- Upwards paired arrows. --->
			<html:symbol>&#8649;</html:symbol> <!--- Rightwards paired arrows. --->
			<html:symbol>&#8650;</html:symbol> <!--- Downwards paired arrows. --->
			<html:symbol>&#8651;</html:symbol> <!--- Leftwards harpoon over rightwards harpoon. --->
			<html:symbol>&#8652;</html:symbol> <!--- Rightwards harpoon over leftwards harpoon. --->
			<html:symbol>&#8653;</html:symbol> <!--- Leftwards double arrow with stroke. --->
			<html:symbol>&#8654;</html:symbol> <!--- Left right double arrow with stroke. --->
			<html:symbol>&#8655;</html:symbol> <!--- Rightwards double arrow with stroke. --->
			<html:symbol>&#8656;</html:symbol> <!--- Leftwards double arrow. --->
			<html:symbol>&#8657;</html:symbol> <!--- Upwards double arrow. --->
			<html:symbol>&#8658;</html:symbol> <!--- Rightwards double arrow. --->
			<html:symbol>&#8659;</html:symbol> <!--- Downwards double arrow. --->
			<html:symbol>&#8660;</html:symbol> <!--- Left right double arrow. --->
			<html:symbol>&#8661;</html:symbol> <!--- Up down double arrow. --->
			<html:symbol>&#8662;</html:symbol> <!--- North west double arrow. --->
			<html:symbol>&#8663;</html:symbol> <!--- North east double arrow. --->
			<html:symbol>&#8664;</html:symbol> <!--- South east double arrow. --->
			<html:symbol>&#8665;</html:symbol> <!--- South west double arrow. --->
			<html:symbol>&#8666;</html:symbol> <!--- Leftwards triple arrow. --->
			<html:symbol>&#8667;</html:symbol> <!--- Rightwards triple arrow. --->
			<html:symbol>&#8668;</html:symbol> <!--- Leftwards squiggle arrow. --->
			<html:symbol>&#8669;</html:symbol> <!--- Rightwards squiggle arrow. --->
			<html:symbol>&#8670;</html:symbol> <!--- Upwards arrow with double stroke. --->
			<html:symbol>&#8671;</html:symbol> <!--- Downwards arrow with double stroke. --->
			<html:symbol>&#8672;</html:symbol> <!--- Leftwards dashed arrow. --->
			<html:symbol>&#8673;</html:symbol> <!--- Upwards dashed arrow. --->
			<html:symbol>&#8674;</html:symbol> <!--- Rightwards dashed arrow. --->
			<html:symbol>&#8675;</html:symbol> <!--- Downwards dashed arrow. --->
			<html:symbol>&#8676;</html:symbol> <!--- Leftwards arrow to bar. --->
			<html:symbol>&#8677;</html:symbol> <!--- Rightwards arrow to bar. --->
			<html:symbol>&#8678;</html:symbol> <!--- Leftwards white arrow. --->
			<html:symbol>&#8679;</html:symbol> <!--- Upwards white arrow. --->
			<html:symbol>&#8680;</html:symbol> <!--- Rightwards white arrow. --->
			<html:symbol>&#8681;</html:symbol> <!--- Downwards white arrow. --->
			<html:symbol>&#8682;</html:symbol> <!--- Upwards white arrow from bar. --->
			<html:symbol>&#8683;</html:symbol> <!--- Upwards white arrow on pedestal. --->
			<html:symbol>&#8684;</html:symbol> <!--- Upwards white arrow on pedestal with horizontal bar. --->
			<html:symbol>&#8685;</html:symbol> <!--- Upwards white arrow on pedestal with vertical bar. --->
			<html:symbol>&#8686;</html:symbol> <!--- Upwards white double arrow. --->
			<html:symbol>&#8687;</html:symbol> <!--- Upwards white double arrow on pedestal. --->
			<html:symbol>&#8688;</html:symbol> <!--- Rightwards white arrow from wall. --->
			<html:symbol>&#8689;</html:symbol> <!--- North west arrow to corner. --->
			<html:symbol>&#8690;</html:symbol> <!--- South east arrow to corner. --->
			<html:symbol>&#8691;</html:symbol> <!--- Up down white arrow. --->
			<html:symbol>&#8692;</html:symbol> <!--- Right arrow with small circle. --->
			<html:symbol>&#8693;</html:symbol> <!--- Downwards arrow leftwards of upwards arrow. --->
			<html:symbol>&#8694;</html:symbol> <!--- Three rightwards arrows. --->
			<html:symbol>&#8695;</html:symbol> <!--- Leftwards arrow with vertical stroke. --->
			<html:symbol>&#8696;</html:symbol> <!--- Rightwards arrow with vertical stroke. --->
			<html:symbol>&#8697;</html:symbol> <!--- Left right arrow with vertical stroke. --->
			<html:symbol>&#8698;</html:symbol> <!--- Leftwards arrow with double vertical stroke. --->
			<html:symbol>&#8699;</html:symbol> <!--- Rightwards arrow with double vertical stroke. --->
			<html:symbol>&#8700;</html:symbol> <!--- Left right arrow with double vertical stroke. --->
			<html:symbol>&#8701;</html:symbol> <!--- Leftwards open-headed arrow. --->
			<html:symbol>&#8702;</html:symbol> <!--- Rightwards open-headed arrow. --->
			<html:symbol>&#8703;</html:symbol> <!--- Left right open-headed arrow. --->

		</html:p>

	</core:Body>
</core:Email>
