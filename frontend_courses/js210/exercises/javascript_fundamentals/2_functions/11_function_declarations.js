logValue();

function logValue() {
  console.log('Hello, world!');
}

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> Hello, world!

JavaScript hoists the function declaration to the top of our program. So, JS interprets our code like this:

```
function logValue() {
  console.log('Hello, world!');
}

logValue();
```

When function declarations are hoisted, they bring their entire blocks with them.
*/

// Further exploration

var logValue2 = 'foo';

function logValue2() {
  console.log('Hello, world!');
}

console.log(typeof logValue2); // string

/*
In this code, `logValue2` is a String. In JavaScript, functions are hoisted first, then variable declarations. So in this case, the code is equivalent to this:
```
function logValue2() {
  console.log('Hello, world!');
}
var logValue2;

logValue2 = 'foo';

console.log(typeof logValue2);
```
*/
