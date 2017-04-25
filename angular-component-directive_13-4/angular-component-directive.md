###Angular 2  Exercise - 13/4/2017


----------

#Component

##What is @Component decorator in Angular 2? What does @Component decorator do?


Component decorator allows you to mark a class as an Angular component and provide additional metadata that determines how the component should be processed, instantiated and used at runtime.

```typescript

import { Component } from '@angular/core';

@Component({
  selector: 'info',
  template: `
 		<p>My name is {{name}}</p>
 		<p>My birthday {{birthday}}</p>
 		<p>My phone is {{phone}}</p>
  `,
})
export class InfoComponent  { 
	name: string = 'Tnkt';
	birthday: string = '21/11/1994';
	phone: string = '01626757797';
}

//index.html
<hello-world> </hello-world>

```

#Directive

##What is @Directive decorator in Angular 2? What does @Directive decorator do?

Directive decorator allows you to mark a class as an Angular directive and provide additional metadata that determines how the directive should be processed, instantiated and used at runtime.

Directives allow you to attach behavior to elements in the DOM


```typescript

//ex.component.ts

import { Component } from '@angular/core';

@Component({
  selector: 'directive',
  template: `
  	<p myColor >Highlight me!</p>

  `,
})
export class DemoDirectiveComponent  { 
}

//ex.directive.ts


import { Directive, ElementRef, Input } from '@angular/core';
@Directive({ selector: '[myColor]' })
export class HighlightDirective {
	@Input('myColor') set config(){
		this.changeColor();
	}
	constructor(private el: ElementRef) {
	}

	changeColor(){
		this.el.nativeElement.style.backgroundColor = 'yellow';
	}
}

```
#Summary

##Explain @Input decorator in Angular 2?

 @Input decorator binds a property within one component (child component) to receive a value from another component (parent component). This is one way communication from parent to child. 
 
##Explain @Output decorator in Angular 2?

@Output decorator binds a property of a component to send data from one component (child component) to calling component (parent component). This is one way communication from child to parent component. @Output binds a property of the type of angular EventEmitter class.

##What is difference between component and directive in Angular 2?

| component | directive |
| --------- | --------- |
|Only one component can be present per DOM element.|Many directive can be used in a per DOM element.|
|@View decorator or templateurl template are mandatory in the component. |Directive don’t have View|
|Component is used to break up the application into smaller components.|Directive is use to design re-usable components.


##Write an example for Two-way data binding in Angular 2?

```typescript

import { Component } from '@angular/core';

@Component({
  selector: 'two-way-data-binding',
  template: `
	<h2> My name is {{name}}
  	<p [myColor] = "yelow" >Highlight me!</p>

  `,
})
export class DemoDirectiveComponent  { 
	name:string = 'Trang';
}

```

