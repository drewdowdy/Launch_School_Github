console.log(a);

var a = 1;

/*
Q: What will the following code log to the console and why? Don't run the code until after you have tried to answer.

A: This code will log the following:

> undefined

In this code, the variable declaration is hoisted to the top of the program. So the program essentially looks like this:

```
var a;
console.log(a);

a = 1;
```

As we can see, the `var` declaration is hosted, initializing `a` but leaving it undefined. So when it's logged to the console, we see `undefined`.
*/
