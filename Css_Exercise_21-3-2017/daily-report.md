Daily Report-21/3/2017


----------
#@import, @media, @font-face

##@inport

The @import CSS at-rule is used to import style rules from other style sheets. These rules must precede all other types of rules, except @charset rules

Syntax
@import url;
@import url list-of-media-queries;
where:
- url:
Is a ```<string>``` or a ```<uri>``` representing the location of the resource to import. The URL may be absolute or relative. Note that the URL need not actually specify a file; it can just specify the package name and part, and the appropriate file is chosen automatically (e.g. chrome://communicator/skin/).

Example:
```html
@import("_variable.scss")
@import("global.scss")
@import url(//fonts.googleapis.com/css?family=Jim+Nightshade);
body {
font-family: 'Jim Nightshade', cursive;
}
```
##@font-face
The @font-face rule allows custom fonts to be loaded on a webpage. Once added to a stylesheet, the rule instructs the browser to download the font from where it is hosted, then display it as specified in the CSS.
**Syntax:**

```html 
@font-face {
    font-family: DeliciousRoman;
    src: url(https://fonts.googleapis.com/css?family=Amatic+SC);
    font-weight:400;
}
at body
body {
  font-family: 'Amatic SC', cursive;
}
another way
@import url(//fonts.googleapis.com/css?family=Open+Sans);
body {
  font-family: 'Open Sans', sans-serif;
}
```
##@media
This rule contains conditional statements for targeting styles to specific screens. These statements can include screen sizes, which can be useful for adapting styles to devices.
**Syntax**
@media ```<media-query-list>``` {
``` <group-rule-body> ```
}
where
```<media-query-list>```  is composed of a optional media type and/or a number of media features.
In head you must have this tag: 
``` <meta name="viewport" content="width=device-width, initial-scale=1.0"/> ```
Example
``` @media and (max-width: 500px) {
    .gridmenu {
        width:100%;
    }
} ```
#Sass (Syntactically Awesome StyleSheets)
Sass is an extension of CSS that adds power and elegance to the basic language. It
allows you to use variables, nested rules, mixins, inline imports, and more, all with a fully CSS-compatible syntax. Sass helps keep large stylesheets well-organized, and get small stylesheets up and running quickly.

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
$text-color: red;
.nav {
    background-color: $text-color;
}
.footer {
    background-color: $text-color;
}
```
- Extend/Inheritance:
This is one of the most useful features of Sass. Using @extend lets you share a set of CSS properties from one selector to another. It helps keep your Sass very DRY.
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
It’s followed by the name of the mixin and optionally the arguments, and a block containing the contents of the mixin.
Mixins are included in the css with the @include directive

```
@mixin set_color($color){
  color: $color;
}
.button{
  @include set_color($text-color) 
}
```
