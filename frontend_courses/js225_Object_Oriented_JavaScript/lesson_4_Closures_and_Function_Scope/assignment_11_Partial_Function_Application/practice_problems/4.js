// In our previous solution, multiplyBy5 retains access to func and b long after makePartialFunc has finished execution. What makes this possible?

function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b);
  }
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

let multiplyBy5 = makePartialFunc(multiply, 5);
let divideBy2 = makePartialFunc(divide, 2);

console.log(multiplyBy5(100)); // 500
console.log(divideBy2(100)); // 50

// Answer:
// This is possible becasue when mutiplyBy5 is initialized, 5 is passed in as an argument and 5 becomes part of the closure around the returned partial function.
