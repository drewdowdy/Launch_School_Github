/*
Log all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
*/

for (let num = 1; num < 100; num += 2) {
  console.log(num);
}

/*
Further Exploration

Repeat this exercise with a technique different from the one that you used, and different from the one provided. Also consider adding a way for the user to specify the limits of the odd numbers logged to the console.
*/

// while loop
let number = 1;

while (number < 100) {
  console.log(number);
  number += 2
}
