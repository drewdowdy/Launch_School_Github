/*
Write a function that takes a string as an argument, and returns the string stripped of spaces from both ends. Do not remove or alter internal spaces.

Example

trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""
*/

let trim = function(string) {
  let result = string;

  // remove the front spaces
  for (let index = 0; index < string.length; index += 1) {
    if (string[index] === ' ') {
      result = result.slice(1);
    } else {
      break;
    }
  }

  // remove the back spaces
  for (let index = string.length - 1; index >= 0; index -= 1) {
    if (string[index] === ' ') {
      result = result.slice(0, result.length - 1);
    } else {
      break;
    }
  }

  console.log("'" + result + "'");
};

trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""
