/*
Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

The rules are as follows:

If the phone number is less than 10 digits, assume that it is a bad number.
If the phone number is 10 digits, assume that it is good.
If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
If the phone number is 11 digits and the first number is not 1, then it is a bad number.
If the phone number is more than 11 digits, assume that it is a bad number.
For bad numbers, just a return a string of 10 0s.

PDBAD

=== PROBLEM ===

Write a function that cleans up a user's input phone number

Rules:
- chars to ignore: ' ', '-', '.', '(', and ')'
- input is a string
- valid phone numbers are 10 digits long
- if the phone number is 11 digits long BUT starts with 1, remove the 1 and return the remaining 10 digits
- invalid phone numbers should return ten zeros

Questions:
- will the input ever contain alphabet chars?
- are the ignored characters part of the output?
- how to handle no input?

VALID requirements:
- 10 digits long
- 11 digits long (starts with 1)

INVALID numbers:
- more than 10 digits

=== DATA ===

input: a string that needs to be cleaned an analyzed
intermediate:
  - an array of digits
output: a cleaned string of a valid phone number OR 10 zeros

=== BRAINSTORM ===

1. break the string into an array of characters
2. remove the special characters to igrore (filter)
  - check if each character is NOT /[^ .-()]/
3. validate the remaining characters in the array
  - if valid
    - clean up the array and join back into a string
  - if NOT valid
    - return a string of 10 zeros

helper function isValidNumber
  - if length is 10 OR (length is 11 AND first digit is 1)
    - if all chars are numbers
    - use a regex?
      - return true
    - else
      - return false
  - else
    - return false
helper function removeSpecialChars
  - select all chars that are not special characters (filter)
    - check if the index of the char exists in " .-()"

=== DEBUG ===

if the number is 11 with a leading 1, remove the leading 1

*/

function cleanUp(arr) {
  return arr.filter(char => ' .-()'.indexOf(char) === -1);
}

function isValidNumber(arr) {
  if (arr.length === 10 || (arr.length === 11 && arr[0] === '1')) {
    if (arr.every(char => /\d/.test(char))) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

function cleanNumber(inputStr) {
  if (inputStr === undefined) return undefined;

  let inputArr = inputStr.split('');
  let cleanArr = cleanUp(inputArr);
  
  if (isValidNumber(cleanArr) && cleanArr.length === 10) {
    return cleanArr.join('');
  } else if (isValidNumber(cleanArr) && cleanArr.length === 11) {
    return cleanArr.slice(1).join('');
  } else {
    return '0000000000';
  }
}

function p(...items) {
  for (let item of items) {
    console.log(item);
  }
}

p(
  // valid numbers
  cleanNumber('1111111111') === '1111111111',
  cleanNumber('1234567890') === '1234567890',
  // valid number with leading 1
  cleanNumber('17573456842') === '7573456842',
  // valid number with special chars
  cleanNumber('555-325-7142') === '5553257142',
  cleanNumber('(555).325-7142') === '5553257142',
  cleanNumber('5 5  5   3    2  5  7 1 4 2') === '5553257142',
  // invalid numbers
  cleanNumber('1234567890111') === '0000000000', // too long
  cleanNumber('123') === '0000000000', // too short
  cleanNumber('27573456842') === '0000000000', // 11 digits but first is NOT 1
  cleanNumber('555-325-71a42') === '0000000000', // has invalid character
  cleanNumber('') === '0000000000', // empty string
  cleanNumber() === undefined, // no input
);
