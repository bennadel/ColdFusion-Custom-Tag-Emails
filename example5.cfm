
<!--- Import custom tag libraries. --->
<cfimport prefix="core" taglib="./core/" />
<cfimport prefix="html" taglib="./core/html/" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<core:Email
	subject="Playing with media queries"
	teaser="Max-widths, Min-widths, oh heck yeah!">
	<core:Body>

		<html:h1>
			Playing with media queries
		</html:h1>

		<core:HtmlEntityTheme entity="p" class="box">
			background-color: #f0f0f0 ;
			padding: 30px 10px 30px 10px ;
			text-align: center ;
		</core:HtmlEntityTheme>

		<html:p class="box">
			Media query styles!
		</html:p>

		<!---
			The MaxWidthStyles and MinWidthStyles are encapsulations of the CSS media-
			query. The "!important" flag is auto-injected so that you don't have to worry
			about always adding it.
		--->
		<core:MaxWidthStyles width="650">
			.box {
				background-color: #d0d0d0 ;
			}
		</core:MaxWidthStyles>
		<core:MaxWidthStyles width="600">
			.box {
				background-color: #c0c0c0 ;
			}
		</core:MaxWidthStyles>
		<core:MaxWidthStyles width="550">
			.box {
				background-color: #a0a0a0 ;
			}
		</core:MaxWidthStyles>
		<core:MaxWidthStyles width="500">
			.box {
				background-color: #909090 ;
				color: #ffffff ;
			}
		</core:MaxWidthStyles>
		<core:MaxWidthStyles width="450">
			.box {
				background-color: #707070 ;
				color: #ffffff ;
			}
		</core:MaxWidthStyles>
		<core:MaxWidthStyles width="400">
			.box {
				background-color: #505050 ;
				color: #ffffff ;
			}
		</core:MaxWidthStyles>
		<core:MaxWidthStyles width="350">
			.box {
				background-color: #303030 ;
				color: #ffffff ;
			}
		</core:MaxWidthStyles>

	</core:Body>
</core:Email>
