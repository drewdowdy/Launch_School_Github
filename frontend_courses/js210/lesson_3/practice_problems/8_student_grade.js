/*
Write a program to determine a student’s grade based on the average of three scores you get from the user. Use these rules to compute the grade:

If the average score is greater than or equal to 90 then the grade is 'A'
If the average score is greater than or equal to 70 and less than 90 then the grade is 'B'
If the average score is greater than or equal to 50 and less than 70 then the grade is 'C'
If the average score is less than 50 then the grade is 'F'
You may assume that all input values are valid positive integers.

Example

// prompts to get the 3 scores
Enter score 1: 90
Enter score 2: 50
Enter score 3: 78

// log to the console
Based on the average of your 3 scores your letter grade is "B".
*/

let readlineSync = require('readline-sync');
let scores = [];

for (let i = 1; i <= 3; i++) {
  let score = readlineSync.question(`Enter score ${i}: `);
  score = Number(score);
  scores.push(score);
}

let sum = 0;

scores.forEach(score => {
  sum += score;
})

let average = sum / scores.length;
let letterGrade;

if (average >= 90) {
  letterGrade = 'A';
} else if (average >= 80) {
  letterGrade = 'B';
} else if (average >= 70) {
  letterGrade = 'C';
} else if (average >= 60) {
  letterGrade = 'D';
} else {
  letterGrade = 'F';
}

console.log(`Based on the average of your 3 scores, your letter grade is "${letterGrade}".`)
