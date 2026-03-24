/*
Write a function that takes a positive integer as an argument, and logs all the odd numbers from 1 to the passed in number (inclusive). All numbers should be logged on separate lines.
*/

// initial idea
function logOddNumbers(num) {
  let output = 1;

  while (output <= num) {
    if (output % 2 !== 0) {
      console.log(output);
    }
    output += 1;
  }
}

// using for loop
function logOddNumbers(num) {
  for (let currentNum = 1; currentNum <= num; currentNum += 1) {
    if (currentNum % 2 === 1) {
      console.log(currentNum);
    }
  }
}

logOddNumbers(19);
/*
output on console
> 1
> 3
> 5
> 7
> 9
> 11
> 13
> 15
> 17
> 19
*/

/*
Further Exploration:

For more practice, consider the following:

You can remove the conditional inside the loop and increment currentNumber by 2 with each step, instead of 1. How would you write code to do that?
Instead of a conditional that checks for odd numbers, you can write a conditional that checks for even numbers, but skips them with the continue statement. How would you write your code?
*/

function logOddNumbers(num) {
  for (let currentNum = 1; currentNum <= num; currentNum += 2) {
    console.log(currentNum);
  }
}

logOddNumbers(19);
