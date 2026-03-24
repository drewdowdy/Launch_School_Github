/*
In this exercise, you will write a program that asks the user for a phrase, then outputs the number of characters in that phrase. Go over the documentation for String to find an appropriate method to use.

Examples:

Please enter a phrase: walk
// console output
There are 4 characters in "walk".

Please enter a phrase: walk, don't run
// console output
There are 15 characters in "walk, don't run".

Further Exploration

The solution counts all the characters in the phrase, including spaces. Refactor it so that it ignores spaces.

Since the refactored program shouldn't count spaces, you can use the String.prototype.replace method to return a new string with all spaces removed from it. Go over the documentation to see how you can do this. The thing to note here is that the first argument passed to replace can be a regular expression pattern.

As an added challenge, further refactor the solution so that it only counts alphabetic characters.
*/


let readlineSync = require('readline-sync');

let phrase = readlineSync.question('Please enter a phrase: ');

let charNum = phrase.length; // counts all characters
let alphanumericNum = phrase.match(/\w/g) // counts all word characters (alphanumeric & underscore)
let letterNum = phrase.match(/[a-z]/ig).length; // counts all letters

console.log(`There are ${charNum} characters in "${phrase}".`);
console.log(`There are ${alphanumericNum} alphanumeric characters in "${phrase}".`);
console.log(`There are ${letterNum} letters in "${phrase}".`);

