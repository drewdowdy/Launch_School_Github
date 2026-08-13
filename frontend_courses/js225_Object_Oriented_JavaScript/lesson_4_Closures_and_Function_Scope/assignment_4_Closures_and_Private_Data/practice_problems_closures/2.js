// Write a program that uses two functions, add and subtract, to manipulate a running total value. When you invoke either function with a number, it should add or subtract that number from the running total and log the new total to the console. Usage looks like this:

function makeAdderSubtractor() {
  let total = 0; // total is now private

  function add(n) {
    total += n;
    console.log(total);
  }

  function subtract(n) {
    total -= n;
    console.log(total);
  }

  return {
    add,
    subtract,
  }
}

let { add, subtract } = makeAdderSubtractor();

add(1);
// 1
add(42);
// 43
subtract(39);
// 4
add(6);
// 10
