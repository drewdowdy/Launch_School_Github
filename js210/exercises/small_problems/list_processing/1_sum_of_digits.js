// Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this without using for, while, or do...while loops - instead, use a series of method calls to perform the sum.

function getDigits(number) {
  return String(number).split('').map(n => parseInt(n, 10))
}

function sum(number) {
  let sum = 0;
  let digits = getDigits(number);

  for (number of digits) {
    sum += number;
  }

  console.log(sum);
  return sum;
}

// with Array.prototype.reduce()
function sum(number) {
  let digits = getDigits(number);
  return digits.reduce((accum, num) => {return accum += num});
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
