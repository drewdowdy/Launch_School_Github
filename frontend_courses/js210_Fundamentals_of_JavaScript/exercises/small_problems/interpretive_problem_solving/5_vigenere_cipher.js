// Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').

/*
=== BRAINSTORM ===

iterate over each char of the message and change the shift based on the keyword

how to keep up with what part of the keyword we are on?
  - modulo wrap?

*/

const UPPERCASE_A_CODE = 'A'.charCodeAt(0) // 65
const UPPERCASE_Z_CODE = 'Z'.charCodeAt(0) // 90
const LOWERCASE_A_CODE = 'a'.charCodeAt(0) // 97
const LOWERCASE_Z_CODE = 'z'.charCodeAt(0) // 122

function caesarEncrypt(message, shift) {
  let result = '';

  for (let char of message) {
    if (!/[a-z]/i.test(char)) {
      result += char;
    } else {
      let charCode = char.charCodeAt(0);
      charCode += shift;

      let min;
      let max;

      if (char.toUpperCase() === char) {
        min = UPPERCASE_A_CODE;
        max = UPPERCASE_Z_CODE;
      } else {
        min = LOWERCASE_A_CODE;
        max = LOWERCASE_Z_CODE;
      }

      let range = (max - min) + 1;
      charCode = ((charCode - min) % range) + min; // modulo wrap code

      newChar = String.fromCharCode(charCode);
      result += newChar;
    }
  }

  return result;
}

function vigenereEncrypt(text, keyword) {
  keyword = keyword.toUpperCase();
  let keywordIndex = 0;
  let result = '';

  for (char of text) {
    if (/[a-z]/i.test(char)) {
      let shift = keyword[keywordIndex].charCodeAt(0) - UPPERCASE_A_CODE;
      let newChar = caesarEncrypt(char, shift);

      result += newChar;
      keywordIndex = (keywordIndex + 1) % keyword.length // wraps around
    } else {
      result += char;
    }
  }

  console.log(result);
  return result;
}

vigenereEncrypt("Pineapples don't go on pizza!", 'A');
// Pineapples don't go on pizzas!

vigenereEncrypt("Pineapples don't go on pizza!", 'Aa');
// Pineapples don't go on pizzas!

vigenereEncrypt("Pineapples don't go on pizza!", 'cab');
// Riogaqrlfu dpp't hq oo riabat!

vigenereEncrypt('Dog', 'Rabbit');
// Uoh


