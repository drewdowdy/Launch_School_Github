/*
Write a function that returns a string converted to lowercase.

To convert a single uppercase character to a lowercase character, get its ASCII numeric representation from the ASCII table, add 32 to that number, then convert the number back to a character using the same ASCII table. You can use the String.fromCharCode and the String.charCodeAt methods for these operations. For example:

let string = 'A';
let asciiNumeric = string.charCodeAt(0);         // 65
asciiNumeric += 32;
string = String.fromCharCode(asciiNumeric);  // "a", converted to lowercase

You may use the square brackets ([]) to access a character by index, and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
*/

function isLetter(character) {
  let charCode = character.charCodeAt(0);

  return (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122);
}

function convertToLowercase(letter) {
  let charCode = letter.charCodeAt(0);
  
  charCode += 32;
  
  if (isLetter(String.fromCharCode(charCode))) {
    return String.fromCharCode(charCode);
  } else {
    return letter;
  }
}

function toLowerCase(string) {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    let char = string[i];
    let charCode = char.charCodeAt(0);

    if (isLetter(char)) {
      result += convertToLowercase(char);
    } else {
      result += char;
    }
  }

  return result;
 }

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"
