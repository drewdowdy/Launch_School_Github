// Write a function that takes a positive integer as an argument and returns that number with its digits reversed.

function reverseNumber(number) {
  console.log(+String(number).split('').reverse().join(''));

  let digits = String(number).split('');
  return parseInt(digits.reverse().join(''), 10);
}

reverseNumber(12345);    // 54321
reverseNumber(12213);    // 31221
reverseNumber(456);      // 654
reverseNumber(12000);    // 21 -- Note that zeros get dropped!
reverseNumber(1);        // 1
