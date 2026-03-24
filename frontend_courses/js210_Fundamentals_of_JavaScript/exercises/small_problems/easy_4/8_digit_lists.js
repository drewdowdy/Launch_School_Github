// Write a function that takes one argument, a positive integer, and returns a list of the digits in the number.

function digitList(number) {
  let stringNum = String(number);
  let digits = [];

  for (let i = 0; i < stringNum.length; i += 1) {
    // digits.push(+(stringNum[i]));
    digits.push(Number(stringNum[i]));
  }

  console.log(digits);
  return digits;
}

// alternative
function digitList(number) {
  return String(number).split('').map(numString => {
    return Number(numString);
  });
}

console.log(digitList(12345));       // [1, 2, 3, 4, 5]
console.log(digitList(7));           // [7]
console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
console.log(digitList(444));         // [4, 4, 4]
