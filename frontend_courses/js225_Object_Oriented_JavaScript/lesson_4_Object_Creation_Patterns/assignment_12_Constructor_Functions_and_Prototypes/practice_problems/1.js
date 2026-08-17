// What does the following code log to the console?

let a = 1;
let foo;
let obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo();

foo.bar();
Foo(); // makes this refer to global object

obj = {};
Foo.call(obj);
obj.bar();

console.log(this.a);

/*
Answer:
This code will log the following in the browser:

> 2 --> bar() is invoked as part of the constructor new Foo()
> 2 --> foo.bar() is a direct invocation
> 2 --> Foo() invokes bar() regardless of new keyword
> 2 --> Foo.call(obj) invokes bar() as it add properties to obj
> 2 --> obj.bar() can be invoked since the function was added as a property
> 2 --> the earlier Foo() invocation gave the `a` property a value of `2` since `this` was the global scope, so `a` on the global object has the value 2
*/
