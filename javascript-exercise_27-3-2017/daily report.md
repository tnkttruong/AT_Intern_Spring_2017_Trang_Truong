Daily Report - 27/3/2017


----------

##What are the differences between a variable that is: `null`, `undefined`?

I think in terms of values `null` and `undefined` are the same
They are different in data type
```javascript

var a;
var b = null;
console.log(typeof a) // undefined
console.log(typeof b) // object
console.log(a==b)	  // true
console.log(a===b)    // false

```

##What is `use strict`? what are the advantages and disadvantages to using it?

If you put "use strict"; at the top of your code (or function), then the JS is evaluated in strict mode. This strict context will prevent certain actions from being thrown and throw more exceptions.

- advantages:

	- prevent bad code, not safe
	- Help we have good habits when code
- Disadvantages:
	- It make the code more complicated, lengthy

##How do you understand DOM tree?

I think DOM tree describes the tree structure of elements of html.
DOM tree has many nodes and each node shows information about the corresponding HTML element in the DOM.

##What are the differences between `==` and `===`? Write an example for each case (if any)?

- `==` : equal to, it will only check value

- `===`: equal value and equal type, it will check both value and data type

```javascript

console.log(0 == '0')  //true
console.log(0 === '0') //false

```

##Explain the differences on the usage of foo between `function foo() {}` and `var foo = function() {}`

- `function foo() {}` :  Function Declaration, is a funtion when the web is loaded it only executed
when we call it

- `var foo = function() {}`: Function Expression , specific : anonymous function expression, is stored in a variable.

##How can JavaScript manipulate HTML dynamically?

At https://www.w3schools.com they say : "With the object model, JavaScript gets all the power it needs to create dynamic HTML:
- JavaScript can change all the HTML elements in the page
- JavaScript can change all the HTML attributes in the page
- JavaScript can change all the CSS styles in the page
- JavaScript can remove existing HTML elements and attributes
- JavaScript can add new HTML elements and attributes
- JavaScript can react to all existing HTML events in the page
- JavaScript can create new HTML events in the page
"

##How to store a Javascript variable at client side?

## localStorage

```javascript

//set value
 localStorage.setItem('data', 'this is data');
//read value
 if ( localStorage.getItem('data') ) {
    console.log(localStorage.getItem('data')); // => this is data
 }

```

##cookie

```javascript

document.cookie = "name=tnkt";
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
  console.log(getCookie('name')); //tnkt

```
