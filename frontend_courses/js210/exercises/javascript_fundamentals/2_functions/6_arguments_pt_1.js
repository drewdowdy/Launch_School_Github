let a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> 7

When the value of `a` is passed into `myValue()` through the parameter `b`, the function uses a copy of the value of `a`, which has no affect on the value of `a` in the outer scope.
*/