/*
The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

Counting from the rightmost digit and moving left, double the value of every second digit
For any digit that thus become 10 or more, subtract 9 from the result
  - 1111 becomes 2121
  - 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
Add all these digits together
  - 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
  - 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

PDBAD

=== PROBLEM ===

Given a string, determine if the number is valid according to the Luhn Formula

1234 --> 2264 --> 2 + 2 + 6 + 4 --> 14 --> does NOT end with 0 --> invalid
12345 --> 1385

Luhn Formula:
1. Starting from the last digit moing left, double each digit
  i. if the doubling is greater than 10, subtract 9
2. Add all of the doubled digits together to get the checksum
3. If the checksum ends with a 0, the input was valid, else it was invalid

Rules:
- input is a string
- ignore all non-numeric characters

Questions:
- will the input always be 4 chars long?

=== DATA ===

input: a string of digits (and possible non-digit chars)
intermediate:
  - a regex to clean the string
  - an array of digits
  - a number that is the sum
output: a boolean true if valid, false otherwise

=== BRAINSTORM ===

1. clean the string of any non-number characters
2. break the string of digits into an array and make them all numbers
3. double all of the numbers starting from the last digit 
4. get the sum of all of those digits
5. check if the sum ends with a zero

=== ALGORITHM ===

1. clean the string of any non-number characters
  - str.replaceAll(/\D/, '')
2. break the string of digits into an array and make them all numbers
  - input.split()
3. double all of the numbers starting from the last digit 
  - digits.reverse.map()
  - only double the nums at ODD indices
  - after doubling, if the number is > 10
    - subtract 9
4. get the sum of all of those digits
  - digits.reduce()
5. check if the sum ends with a zero
  - checksum % 10 === 0

=== DEBUG ===

Input is a string of any length. Example is one long string
*/

function p(...items) {
  for (item of items) {
    console.log(item);
  }
}

function isLuhnValid(digitStr) {
  let cleaned = digitStr.replaceAll(/\D/g, '');
  let digits = cleaned.split('').map((str) => parseInt(str, 10));
  
  let doubled = digits
    .reverse()
    .map((num, i) => {
      if (i % 2 === 0) { // if index is even
        return num;
      } else { // if index is odd
        let double = num * 2
        return double >= 10 ? double - 9 : double;
      }
    })
    .reverse();

  let checksum = doubled.reduce((sum, current) => {
    sum += current;
    return sum;
  });

  return checksum % 10 === 0;
}

p(
  // valid
  isLuhnValid('8763') == true,
  // invalid
  isLuhnValid('1234') == false,
  isLuhnValid('1111') == false,
  // ignore non-numeric chars
  isLuhnValid('2323 2005 7766 3554') === true, // has spaces
  isLuhnValid('8a7b6c3') == true, // has letters
  isLuhnValid('--  8zz7a63@') == true, // has special chars
);
