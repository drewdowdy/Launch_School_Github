/*
For this exercise we're going to learn more about type conversion by implementing our own parseInt function that converts a string of numeric characters (including an optional plus or minus sign) to a number.

The function takes a string of digits as an argument, and returns the appropriate number. Do not use any of the built-in functions for converting a string to a number type.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

Examples:

stringToInteger('4321');      // 4321
stringToInteger('570');       // 570
*/

const DIGITS = {
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '0': 0,
}

function stringToInteger(str) {
  let result = 0;
  let digit_regex = /[0-9]/;
  let multiplier = str[0] === '-' ? -1 : 1;
  
  // cut off optional + / -
  if (str[0] === '-' || str[0] === '+') {
    str = str.slice(1);
  }

  for (let i = 0; i < str.length; i += 1) {
    if (str[i].match(digit_regex)) {
      result = (result * 10) + DIGITS[str[i]]
    }
  }

  result = result * multiplier;

  return result;
}

console.log(stringToInteger('4321'));  // 4321
console.log(stringToInteger('570'));   // 570
console.log(stringToInteger('+4321')); // 4321
console.log(stringToInteger('-570'));  // -570
