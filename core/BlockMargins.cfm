
<!--- Define custom tag attributes. --->
<cfparam name="attributes.margins" type="string" default="none normal" />

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfswitch expression="#thistag.executionMode#">
	<cfcase value="start">

		<cfset margins = splitMargins( attributes.margins ) />

		<cfmodule template="./Margin.cfm" size="#arrayFirst( margins )#">

	</cfcase>
	<cfcase value="end">

		<cfmodule template="./Margin.cfm" size="#arrayLast( margins )#">

	</cfcase>
</cfswitch>

<!--- // ------------------------------------------------------------------------- // --->
<!--- // ------------------------------------------------------------------------- // --->

<cfscript>

	/**
	* I split the given margins into an array.
	* 
	* @value I am the margins value being split.
	*/
	public array function splitMargins( required string value )
		cachedWithin = "request"
		{

		return( listToArray( arguments.value, " " ) );

	}

</cfscript>
