Typescript + ES6  Exercise - 7/4/2017


----------
#Typescript

##What is TypeScript and Why do we need it?

Wikipedia say: "TypeScript is a free and open-source programming language developed and maintained by Microsoft".
I think TypeScript help us to code javascipt easlier, faster, simpler and more effective.

##How can you get TypeScript and install it?

```npm install -g typescript```

##How do you compile TypeScript files?

``` tsc --watch url_file.ts url_file.js```

##Which Object Oriented terms are supported by TypeScript? Write an example.

- **interface**:

Example:

```typescript

interface Intern{
	name: string;
	team: string;
}

function showInfo(intern: Intern){
	return "Name: " + intern.name + "\n" + intern.team;
}

console.log(showInfo({name: "Trang", team: "Ruby"}));

```

- **Class**:

Example:

```typescript

class Intern{
	name: string;
	constructor(name){
		this.name = name;
	}
	hello(){
		return "Hello my name is " + this.name;
	}
}

let me = new Intern("Tnkt");
console.log(me.hello());

```



##How do you implement inheritance in TypeScript? Write an example.

```typescript

class Carriage {
	constructor(private name: string, private wheel: number){
	}
	info(){
		document.write(`${this.name} ${this.wheel}`);
	}
}

class Honda extends Carriage {
}

 var xe = new Honda('air blade', 2);
 xe.info();
```

#ES6

##Write an example for each of the following new features in ES6

- Template Literals

```typescript

var name = 'Tnkt';
var html = ` <p> my name is ${name} </p> ` ;
// <==> var html = " <p> my name is " + $name + " </p>" ;

```

- Multi-line strings

```typescript

var string =  `hello
				my name is Tnkt`;
//<==> var string = "hello \n my name is Tnkt";

```

- Arrow Function

```typescript

	arr.forEach((i) => {
		console.log(i);
	});
// <==> arr.forEach(function(i){ console.log(i); });
```

- For...of

```typescript

	  for (var $i of $arr){} 
//<==>  for (var i = 0, count = $arr.length; i < count; i++) {}

```

- Default parameters

```typescript

class Carriage {
	constructor(private name: string = "xe Xe Co Co"){
	}
}
ex = new Carriage("Tnkt");
ex.name // Tnkt
ex1 = new Carriage();
ex1.name //xe Xe Co Co


```




