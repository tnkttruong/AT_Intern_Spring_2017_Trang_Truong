Daily Report-15/3/2017
#CSS
##What is CSS?
CSS is a language that describes the style of an HTML document.
CSS describes how HTML elements should be displayed.
##CSS Syntax
selector { property:value;}
###CSS Selectors:
- Element selectors: h, p, div ... (html tags)
- Class selectors: name of class of html tags
- ID selectors: name of ID of htmltags
##Pseudo
###Pseudo-classes
A pseudo-class is used to define a special state of an element.
:hover, :first-child ...
Syntax
> ```selector:pseudo-class {
>     conttent: ""
    property:value;
}```
###Pseudo-Elements
A CSS pseudo-element is used to style specified parts of an element.
::after, ::before, ::first-line ...
Syntax
> ```selector::pseudo-element {
	    conttent: ""
    property:value;
}```

##Priority in css
External < Internal < Inline << Important
Point of Priority:
- element: 1
- class: 10
- id: 100
- inline: 1000
- important: 10000

