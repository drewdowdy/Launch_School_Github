// Our earlier implementation of the Function.prototype.bind was simplistic. Function.prototype.bind has another trick up its sleeve besides hard-binding functions to context objects. It's called partial function application. Read this assignment and the MDN documentation to learn more about partial function application.

// Alter the myBind function written in the previous exercise to support partial function application of additional arguments to the original function.

function myBind(func, context, ...partialArgs) {
  return function(...restArgs) {
    let allArgs = partialArgs.concat(restArgs);
    return func.apply(context, allArgs);
  };
}

function add(a, b) {
  return a + b;
}

addFive = myBind(add, null, 5);
addTen = myBind(add, null, 10);

console.log(addFive(5)); // 10
console.log(addFive(6)); // 11

console.log(addTen(5)); // 15
console.log(addTen(6)); // 16
