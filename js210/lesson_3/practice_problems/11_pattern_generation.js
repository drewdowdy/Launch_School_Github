/*
Write a function that takes a number of rows as the argument nStars and logs a square of numbers and asterisks. For example, if nStars is 7, log the following pattern:

generatePattern(7);

// console output
1******
12*****
123****
1234***
12345**
123456*
1234567

You may assume that nStars is greater than 1 and less than 10.
*/

// function generatePattern(length) {
//   let numberString = '';

//   for (let num = 1; num < length; num++) {
//     numberString += String(num);
//     console.log(numberString + '*'.repeat(length - num));
//   }
// }

// refactored to maintain a rectangle
function generatePattern(length) {
  let allNumbers = '';

  for (let i = 1; i <= length; i++) {
    allNumbers += String(i);
  }

  let totalLength = allNumbers.length;
  
  let numberString = '';

  for (let num = 1; num < length; num++) {
    numberString += String(num);
    console.log(numberString + '*'.repeat(totalLength - numberString.length));
  }
}

generatePattern(7);
generatePattern(20);

// console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567
