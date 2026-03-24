/*
Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 1.4105003956066297e+23
*/

// run `npm install readline-sync` before

const readlineSync = require("readline-sync");
firstNumber = Number(readlineSync.question('===> What is the first number? '));
secondNumber = Number(readlineSync.question('===> What is the second number? '));

console.log(`===> ${firstNumber} + ${secondNumber} = ${firstNumber + secondNumber}`);
console.log(`===> ${firstNumber} - ${secondNumber} = ${firstNumber - secondNumber}`);
console.log(`===> ${firstNumber} * ${secondNumber} = ${firstNumber * secondNumber}`);
console.log(`===> ${firstNumber} / ${secondNumber} = ${firstNumber / secondNumber}`);
console.log(`===> ${firstNumber} % ${secondNumber} = ${firstNumber % secondNumber}`);
console.log(`===> ${firstNumber} ** ${secondNumber} = ${firstNumber ** secondNumber}`);

// 'safe' integers are numbers less than 2^53

let max = (2 ** 53) - 1;
console.log(Number.MAX_SAFE_INTEGER === max);

console.log((2 ** 53) - 1);
console.log((2 ** 53), '\n');

console.log((2 ** 53) + 1, '\n'); // does not add correctly

console.log((2n ** 53n) + 1n); // adds correctly
console.log((BigInt(2) ** BigInt(53)) + BigInt(1)); // Alternate

/*
We must use BigInt for numbers 2^53 or greater. We can use bigint() or add `n` next to numbers. It acts like integers and doesn't do floating point notation
*/
