// The code below throws an error:
// What kind of problem does this error highlight? Use an IIFE to address it, so that code runs without error.

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
}

// sum += sum(numbers);  // ?

// Answer:
// In this case, the function sum and the variable sum have a naming conflict. Due to hoisting, sum is a primitive value and can't be used as a function.

sum += (function(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);

console.log(sum);
