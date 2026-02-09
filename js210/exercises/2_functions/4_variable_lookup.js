var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> This is global

Outer scoped variables are accessible to inner scopes. So `someFunction()` has access to `myVar` and logs its value.
*/