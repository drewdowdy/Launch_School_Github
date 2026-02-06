const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello');
}

if (!myString) {
  console.log('World');
}

if (!!myArray) {
  console.log('World');
}

if (myOtherString || myArray) {
  console.log('!');
}

/*
Q: Go over the following program. What does it log to the console at lines 7, 11, 15, and 19? Is it what you expected? Why or why not?

~~~

A: This will log the following:

> Hello
> World
> !

First, `myBoolean` evaluates to true, so `Hello` is logged.
Next, `myString` is a string with the value `'hello'`. The bang (!) makes it evaluate to false, so the block isn't executed.
Next, `myArray` is an empty array and its preceeded by a double bang (!!) which evaluates to true, so `'World'` is logged.
Finally, `myOtherString` is an empty string which is falsy, but `myArray` is truthy, so `[]` is returned which is truthy so `!` is logged.
*/