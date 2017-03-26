Exercise-21-22/3/2017


----------
#CSS

##How to properly make initial styles render correctly across browsers / platforms?

HTML Responsive Web Design is use CSS and HTML to resize, hide, shrink, enlarge, or move the content to make it look good on any screen.
- Responsive web design makes your web page look good on all devices.
- Responsive web design uses only HTML and CSS.
- Responsive web design is not a program or a JavaScript.

To use it in head you must have this tag: 

```
<meta name="viewport" content="width=device-width, initial scale=1">
```
Css:
``` 
@media screen and (max-width: 480px) {
    .gridmenu {
        width: 100%;
    }
}
```


##What is the "box model" in CSS? Which CSS properties are a part of it?

- The CSS box model is a box that wraps around every HTML element.
- CSS properties are a part of it:
  - Padding: Clears an area around the content. The padding is transparent
  - Border: A border that goes around the padding and content
  - Margin: Clears an area outside the border. The margin is transparent

##What is better way to clear `float`?
Use the clear Property:
Example:

``` 
div {
    clear: left;
}

```

## The CSS `media` query syntax.
**Syntax:**
```
@media not|only mediatype and (media feature) {
    CSS-Code;
}
```
- Media Types:
  - all: Used for all media type devices
  - print: Used for printers
  - screen: Used for computer screens, tablets, smart-phones etc.
  -  etc
- Media Features"
	- color
	- height
	- max-height
	- max-width
	- min-height
	- min-width
	- etc.
##What is `font-face`?
The @font-face rule allows custom fonts to be loaded on a webpage. Once added to a stylesheet, the rule instructs the browser to download the font from where it is hosted, then display it as specified in the CSS

```
	font-family: UTM-BryantLG;
	src: url("font/UTMBryantLG.ttf");
}
h1{
font-family: "UTM-BryantLG", serif; 
}
```

#**Sass**

##How does "CSS Pre-processor" work?

We code at .scss file then it will be converted to a css flie and our web will use css file

##What are the advantages when working with Sass?

- Fully CSS-compatible.
- Language extensions such as variables, nesting, and mixins.
- Many useful functions for manipulating colors and other values
- Advanced features like control directives for libraries.
- Well-formatted, customizable output.

##How to write `pseudo-elements` and `pseudo-classes` in Sass?

###pseudo-classes: 

```
ul{
	li{
		font-size: 14px;
	}
	li:last-child{
		font-size: 15px;
	}
}
```

###pseudo-elements:

```
p {
  font-weight: bold;
    &:first-letter {
        font-weight: normal;
    }
```

##Describe about rules to working with SASS?

### Nested

Sass will let you nest your CSS selectors in a way that follows the same visual hierarchy of your HTML.
```css
body{
  header{
	  .sologan{
		  color: red;
	  } 
  }
  main{
    padding: 50px 30px;
  }
}
```

###Variables

creat a variable and you can use it again.
```css
	$color: red;
	.title{
		color: $color;
	}
```

###Extends

One of the more interesting features of Sass, this lets you attach one class’ attributes to another class.

```css
%list-none{
	list-style: none;
}
header{
	ul{
		@extend %list-none;
	}
}

```

### Mixins:

A mixin lets you make groups of CSS declarations that you want to reuse throughout your site

```css
$float_l: left;
@mixin float_block($float){
	float: $float;
}

{
	.logo{
		@include float_block($float_l);
	}
}
```









