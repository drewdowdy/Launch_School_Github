function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: The code will log the following:

> This is global

When we don't use a declaration keyword when creating variables, the value is interpreted as a property of the global object, making it accessible everywhere.
*/