var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> This is local.

The `myVar` variable declared on line 4 shadows the `myVar` variable in the outer scope of the function so JS only has access to the inner scoped variable.
*/