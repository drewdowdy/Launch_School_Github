// Write a program that solicits six numbers from the user and logs a message that describes whether the sixth number appears among the first five numbers.

// Examples:

// Enter the 1st number: 25
// Enter the 2nd number: 15
// Enter the 3rd number: 20
// Enter the 4th number: 17
// Enter the 5th number: 23
// Enter the last number: 17
// 
// The number 17 appears in [25, 15, 20, 17, 23].
// 
// -----
// 
// Enter the 1st number: 25
// Enter the 2nd number: 15
// Enter the 3rd number: 20
// Enter the 4th number: 17
// Enter the 5th number: 23
// Enter the last number: 18
// 
// The number 18 does not appear in [25, 15, 20, 17, 23].

const readlineSync = require('readline-sync');

function numberSuffix(number) {
  switch (number) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

let numbers = [];

for (let current = 1; current <= 5; current += 1) {
  let numberString = readlineSync.question(`Enter the ${current}${numberSuffix(current)} number: `);
  let number = parseInt(numberString, 10);

  numbers.push(number);
}

let lastNumber = parseInt(readlineSync.question('Enter the last number: '), 10);

if (numbers.includes(lastNumber)) {
  console.log(`The number ${lastNumber} appears in [${numbers.join(', ')}].`);
} else {
  console.log(`The number ${lastNumber} does not appear in [${numbers.join(', ')}].`);
}
