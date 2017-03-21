Daily Report-21/3/2017


----------
#@import, @media, @font-face
##@inport
The @import CSS at-rule is used to import style rules from other style sheets. These rules must precede all other types of rules, except @charset rules; as it is not a nested statement, @import cannot be used inside conditional group at-rules.

Syntax
@import url;
@import url list-of-media-queries;
where:
- url:
Is a <string> or a <uri> representing the location of the resource to import. The URL may be absolute or relative. Note that the URL need not actually specify a file; it can just specify the package name and part, and the appropriate file is chosen automatically (e.g. chrome://communicator/skin/). See here for more information.

- list-of-media-queries:
Is a comma-separated list of media queries conditioning the application of the CSS rules defined in the linked URL. If the browser does not support any these queries, it does not load the linked resource.

Example:
```html
@import("_variable.scss")
@import("global.scss")
@import url(//fonts.googleapis.com/css?family=Open+Sans)
```
##@font-face
The @font-face rule allows custom fonts to be loaded on a webpage. Once added to a stylesheet, the rule instructs the browser to download the font from where it is hosted, then display it as specified in the CSS.
**Syntax:**

```html 
@font-face {
  font-family: 'MyWebFont';
  src: url('myfont.woff2') format('woff2'),
       url('myfont.woff') format('woff'),
       url('myfont.ttf') format('truetype');
}
at body
body {
  font-family: 'MyWebFont', Fallback, sans-serif;
}
another way
@import url(//fonts.googleapis.com/css?family=Open+Sans);
body {
  font-family: 'Open Sans', sans-serif;
}
```
##@media
This rule contains conditional statements for targeting styles to specific screens. These
statements can include screen sizes, which can be useful for adapting styles to
devices.
**Syntax**
@media not|only mediatype and (media feature) {
    CSS-Code;
}
You can also have different stylesheets for different media:
```
<link rel="stylesheet" media="mediatype and|not|only (media feature)" href="mystylesheet.css">
```

Example
```
@media only screen and (max-width: 500px) {
    .gridmenu {
        width:100%;
    }
}
```
#Sass (Syntactically Awesome StyleSheets)
Sass is an extension of CSS that adds power and elegance to the basic language. It
allows you to use variables, nested rules, mixins, inline imports, and more, all with a
fully CSS-compatible syntax. Sass helps keep large stylesheets well-organized, and get
small stylesheets up and running quickly.
**Features**
Fully CSS-compatible.
Language extensions such as variables, nesting, and mixins.
Many useful functions for manipulating colors and other values.
Advanced features like control directive

##SASS Rule:
- Nested
Sass lets you nest style selectors. This helps your organize your CSS by letting you group related rules together and achieve a nice visual hierarchy in your code.

```
	.header {

    padding: 20px;

    ul {
        margin: 20px 0;

        li {
            display: inline-block;
            float: left;
        }
    }
}
```
- Variables:
```
$main-color: #0964DD;
.nav {
    background-color: $main-color;
}
.footer {
    background-color: $main-color;
}
```
- Extend/Inheritance:
This is one of the most useful features of Sass. Using @extend
lets you share a set of
CSS properties from one selector to another. It helps keep your Sass very DRY.
@extend works by inserting the extending selector anywhere in the stylesheet that the extended selector appears.
```
.sfb-1{
	border: 1px solid red;
}
%sbf{
	padding: 10px;
}
.button{
	@extend .sfb-1;
	@extend %sbf;
}

result
.sfb-1, .button {
  border: 1px solid red; }

.button {
  padding: 10px; 
```
- Mixin: @mixin
It’s followed by the name of the mixin and optionally the arguments, and a block
containing the contents of the mixin.

```
@mixin set_color($color){
	color: $color;
}
.button{
	@include set_color($text-color) 
}
```

