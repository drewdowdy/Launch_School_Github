/*
Write a function logMultiples that takes one argument number. It should log all multiples of the argument between 0 and 100 (inclusive) that are also odd numbers. Log the values in descending order.

You may assume that number is an integer between 0 and 100.
*/

function logMultiples(number) {
  let multiples = [];

  for (let multiple = 1; multiple <= 100; multiple += 2) {
    if (multiple * number <= 100) {
      multiples.push(multiple);
    }
  }

  while (multiples[0] !== undefined) {
    console.log(number * multiples.pop());
  }
}

//another solution
function logMultiples(number) {
  for (let currentMultiple = 99; currentMultiple >= number; currentMultiple -= 2) {
    if (currentMultiple % number === 0) {
      console.log(currentMultiple); // only prints 99
    }
  }
} 

logMultiples(17);
/*
output (5x, 3x and 1x)
85
51
17
*/

logMultiples(21);
/*
output (3x and 1x)
63
21
*/