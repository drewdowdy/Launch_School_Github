var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> This is local

On line 4, `myVar` is reassigned to the string `'This is local'`. After invoking the function on line 7 and changing the value, the updated value is logged on line 8.
*/