// Consider the code below:
// Are either of the values 1 or ['this is an array'] eligible for garbage collection on line 5? What about on line 10?

let myNum = 1;

function foo() {
  let myArr = ['this is an array'];
  // what is eligible for GC here?
}

foo();

// what is eligible for GC here?

// more code

/*
Answer:

Line 5:
  - 1 --> No.
  - ['this is an array'] --> No. Still in the function scope of foo().
Line 10:
  - 1 --> No. In the global scope so not eligible until program finishes.
  - ['this is an array'] --> Yes. Only scoped to the execution of foo().
*/