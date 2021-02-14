
# Email DSL Using ColdFusion Custom Tags

This is a proof-of-concept in using ColdFusion custom tags to create a DSL (Domain Specific Language) for generating email content. I've worked on a lot of emails in my life; and, they are very challenging, usually using a complex set of build-tools that inline CSS. I wanted to try something else - something less "magical" - that would be more brute-force and _more predictable_.

## Special Considerations

* Outlook on Windows will clip images if they are contained within a parent that has an explicit `line-height`. To get around this, the several of the HTML entities support the class, `html-entity-line-height-reset`. This will "unset" the `line-height` and apply an `at-least` value for Outlook clients.
