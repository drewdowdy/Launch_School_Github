// Build a program that logs when the user will retire and how many more years the user has to work until retirement.

// Example:

// What is your age? 30
// At what age would you like to retire? 70

// It's 2017. You will retire in 2057.
// You have only 40 years of work to go!

let readlineSync = require('readline-sync');

let currentAge = parseInt(readlineSync.question('What is your age? '), 10);
let retireAge = parseInt(readlineSync.question('At what age would you like to retire? '), 10);
let workingYears = retireAge - currentAge;

let today = new Date();
let currentYear = today.getFullYear();
let retireYear = currentYear + workingYears;

console.log(`It's ${currentYear}. You will retire in ${retireYear}.`);
console.log(`You have only ${workingYears} years of work to go!`);
