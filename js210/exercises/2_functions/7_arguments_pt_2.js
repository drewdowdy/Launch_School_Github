let a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> 7

The inner scope `a` shadows the outer scope `a`, meaning than any changes to the value of `a` within the scope of `myValue()` has no affect on the `a` in the outer scope.
*/