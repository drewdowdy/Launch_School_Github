// Write a function that takes a string, doubles every consonant character in the string, and returns the result as a new string. The function should not double vowels ('a','e','i','o','u'), digits, punctuation, or whitespace.

const CONSONANTS = /[^aeiou\W_\s\d]/i;

function isConsonant(char) {
  return CONSONANTS.test(char);
}

function doubleConsonants(string) {
  let stringArray = [];

  for (let i = 0; i < string.length; i += 1) {
    stringArray.push(string[i]);
    if (isConsonant(string[i])) stringArray.push(string[i]);
  }

  console.log(stringArray.join(''));
  return stringArray.join('');
}

doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""
