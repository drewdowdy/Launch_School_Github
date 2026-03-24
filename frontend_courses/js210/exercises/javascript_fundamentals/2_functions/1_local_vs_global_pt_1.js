var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: It'll log the following:

> This is global

`myVar` on line 4 is scoped to the function and isn't accessible in the top level scope.
*/