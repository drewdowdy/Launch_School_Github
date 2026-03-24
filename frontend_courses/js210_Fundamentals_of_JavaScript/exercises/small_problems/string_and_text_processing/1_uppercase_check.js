// Write a function that takes a string argument and returns true if all of the alphabetic characters inside the string are uppercase; otherwise, return false. Ignore characters that are not alphabetic.

function removeNonAlphabetic(string) {
  return string.replace(/[\W\s\d]/g, '');
}

function isUppercase(string) {
  let cleanString = removeNonAlphabetic(string);

  for (let i = 0; i < cleanString.length; i += 1) {
    let currentChar = cleanString[i];

    if (currentChar.toUpperCase() !== currentChar) {
      return false;
    }
  }

  return true;
}

// with a simple regex

function isUppercase(string) {
  return !/[a-z]/.test(string);
}

console.log(isUppercase('t'));               // false
console.log(isUppercase('T'));               // true
console.log(isUppercase('Four Score'));      // false
console.log(isUppercase('FOUR SCORE'));      // true
console.log(isUppercase('4SCORE!'));         // true
console.log(isUppercase(''));                // true
