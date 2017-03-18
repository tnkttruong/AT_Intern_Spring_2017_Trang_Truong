# HTML + CSS Exercise
##HTML
###What is the required attribute in `form`?
The required attribute is a boolean attribute.
When present, it specifies that an input field must be filled out before submitting the form.
- Elements used: 
input types: text, search, url, tel, email, password, date pickers, number, checkbox, radio, and file
- Syntax
> ```<input required>```

##CSS
###What's the difference between inline and inline-block?
- inline: cannot have a width and height set
- inline-block: respect height and width

    <p>This is <span style="background-color: red;display: inline;width: 100px;height: 50px;">inline </span> text</p>
    <p>This is <span style="background-color: red;display: inline-block;width: 150px;height: 100px;">inline-block</span> text</p>
    
 ### What's the difference between a pseudo-class and a pseudo-element?
- syntax
 -  pseudo-class:
> selector:pseudo-class {
    property:value;}

 -  pseudo-element: 
> selector::pseudo-element {
    property:value;}

- A pseudo class is a selector while a pseudo element is a new element
 - Pseudo classes are for selecting elements that exist but you can't select with the DOM. There's no way to tell what div being hovered in the markup, it depends on the action of the user. The div exists, but there's no way to select it with a normal class. Pseudo classes can be chained and used like a regular classes.
 - A pseudo element selects elements that don't exist, creating a new virtual element. For instance, there's no tags for the first-line of an element. So it's like ::first-line is creating virtual tags to make it select-able. You can only use one pseudo element per selector, unlike Pseudo classes.

###What's the difference between `visibility:hidden` and `display:none`
- `visibility:hidden` hides an element, but it will still take up the same space as before. The element will be hidden, but still affect the layout.
- `display:none` hides an element, and it will not take up any space. The element will be hidden, and the page will be displayed as if the element is not there
- Example:
<h2>This is normal</h2>
<h2 style="display:none;">This is display: none</h2>
<h2>This is normal</h2>
<h2 style="visibility:hidden;">This is visibility:hidden</h2>
<h2>This is normal</h2>
### What's the difference between a relative, fixed, absolute and statically positioned element?
- `relative`: Used to set an element using position attributes (see below) without affecting the initial display.
- `absolute`: Used to set the position of an element but it will always remain in the parent element relative.
- `fixed`: Display always follows the browser when scrolling the page.
-  `Static`:  Set the element to the display by default

#### Example
- relative
	<span style="position: relative; top: 59px;color:red;font-size:20px;"> this is span</span>
   <p style="border: 1px solid #333;"> This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text</p>

- absolute
	<div style="position:relative;height:300px;width:300px;background-color:green;">
	<p style="border: 1px solid red;width:100px;position:absolute;right: 0;"> This is text </p>
	</div>
- static (default)
 <p style="border: 1px solid #333;position:static;"> This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text</p>
  <p style="border: 1px solid #333;position:static;"> This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text This is text</p>
