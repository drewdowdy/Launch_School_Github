/*
Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.

PDBAD

=== PROBLEM ===

Swap all of the alphabet chars in a string with all of the numbers in a string

Rules:
- letters and nums swap one by one
  - the first instance of a num/letter swaps with the first instance of the next num/letter
- special characters should remain where they are
- 

=== DATA ===

input: a string of letters, numbers and other characters
intermediate:
  - an array of digits
  - an array of letters
  - regex to determine if a char is a letter
  - regex to determine if a char is a number
output: a new string where the letters and numbers are swapped

=== BRAINSTORM ===

1. get a list of all the numbers in order from the input
2. get a list of all the letters in order from the input
3. iterate over each character in the input
  - if the current char is a special character
    - no change
  - if the current char is a number
    - get AND remove the first letter from the letter list
  - if the current char is a letter
    - get AND remove the first number from the number list

how to get and remove elements from array?
  - splice(idx, 1)

=== ALGORITHM ===

- use a regex to make an array of numbers from the input
  - str.match(/\d/g)
- use a regex to make an array of letters from the input
  - str.match(/[a-z]/gi)
- iterate over each char of the index (map)
  - if char is a special character /[^a-z\d]]/
    - return char
  - if char is a number /\d/
    - return first letter from list
    - letterList.splice(0, 1)
  - if char is a letter /[a-z]/i
    - return first number from list
    - numberList.splice(0, 1)

=== DEBUG ===

if no numbers or letters are found, its undefined, not an empty array
  - if match returns undefined, used nullish operator to assign it to an empty array

shift() is simpler than splice(0, 1)[0]

*/

function swap(str) {
  let allNumbers = str.match(/\d/g) ?? [];
  let allLetters = str.match(/[a-z]/gi) ?? [];

  function transformationCallback(char, idx) {
    if (/\d/.test(char) && allLetters.length !== 0) {
      return allLetters.shift();
    } else if (/[a-z]/i.test(char) && allNumbers.length !== 0) {
      return allNumbers.shift();
    } else {
      return char;
    }
  }

  return str.split("").map(transformationCallback).join("");
}

console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true
/*
"abcd123"
"123dabc"
*/

// empty string
console.log(swap("") === ""); // true

// fewer nums than letters and vise versa
console.log(swap("12a") === "a21"); // true
console.log(swap("ab1") === "1ba"); // true
console.log(swap("abcd") === "abcd"); // true
console.log(swap("1") === "1"); // true

// special chars
console.log(swap("123-4a#b$") === "ab3-41#2$"); // true

// uppercase letters
console.log(swap("ab1CD23") === "12a3DbC"); // true
