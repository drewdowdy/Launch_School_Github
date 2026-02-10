/*
Write a function that iterates over the integers from 1 to 100, inclusive. For multiples of three, log "Fizz" to the console. For multiples of five, log "Buzz". For numbers which are multiples of both three and five, log "FizzBuzz". For all other numbers, log the number.

Your output should look like this:

fizzbuzz();

// console output
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
// … rest of output omitted for brevity
*/

function fizzbuzz() {
  for (let current = 1; current <= 100; current++) {
    if (current % 3 === 0 && current % 5 === 0) {
      console.log('FizzBuzz');
    } else if (current % 3 === 0) {
      console.log('Fizz');
    } else if (current % 5 === 0) {
      console.log('Buzz');
    } else {
      console.log(current);
    }
  }
}

// as an arrow function
// let fizzbuzz = () => {
//   for (let current = 1; current <= 100; current++) {
//     if (current % 3 === 0 && current % 5 === 0) {
//       console.log('FizzBuzz');
//     } else if (current % 3 === 0) {
//       console.log('Fizz');
//     } else if (current % 5 === 0) {
//       console.log('Buzz');
//     } else {
//       console.log(current);
//     }
//   }
// }; // use the semicolon after arrow function!

// Further Exploration: try to refactor it
function fizzbuzz() {
  for (let current = 1; current <= 100; current++) {
    let message = '';

    if (current % 3 === 0) {
      message += 'Fizz';
    }
    
    if (current % 5 === 0) {
      message += 'Buzz';
    }

    console.log(message || current); // empty strings are falsy!
  }
}

function fizzbuzz() {
  for (let current = 1; current <= 100; current++) {
    let message = (current % 3 === 0 ? 'Fizz' : '') +
                  (current % 5 === 0 ? 'Buzz' : '');
    console.log(message || current);
  }
}

fizzbuzz();