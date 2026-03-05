// What does the following code log? Why is this so?

let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

function totalPayable(item, quantity) {
  return startingBalance + (item * quantity);
}

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity)); // 40

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity)); // 45

// `startingBalance` is initialized in the global scope, so the inner scope of `totalPayable` has access to its value.

// when line 12 is executed, the current value of `startingBalance` is 5, so when it's passed into the function `totalPayable()`, 5 + (5 * 7) is returned.

// when line 15 is executed, the current value of `startingBalance` is 10, so when it's passed into the function `totalPayable()`, 10 + (5 * 7) is returned
