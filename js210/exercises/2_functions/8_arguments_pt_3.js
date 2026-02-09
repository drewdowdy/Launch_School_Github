let a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a);
console.log(a);

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> [1, 2, 10]

In this case, when we pass in the array into `myValue()`, both `a` and `b` reference the same array in memory. So when we change the value at index 2, the array referenced by `a` is mutated.
*/
