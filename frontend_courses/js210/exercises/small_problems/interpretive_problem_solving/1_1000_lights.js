// You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

// Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.

/*
PDBAD

=== PROBLEM ===

Write a function that returns an array of the lights that are remaining on after n repetitions of swithching the lights

Rules:  
- On pass n, switch any light that is is divisible by n
- the first light is 1, not 0
- With each pass change each light (off --> on; on --> off)

=== DATA ===

Input: integer that is the number os light switches

Intermediate:
- array of lights
- boolean values for light state (true -> on; false -> off)

Output: array that is the position of the lights that remain on

=== BRAINSTORM ===

- create an array of lights that are all off
- go through all the lights and change them if the current light position is divisible by the number of the pass
- check which lights remain on and put their positions in an array
- return that array

only the squares of each number remain on...

alternative:
- start iterating up from 1
- square the current number n
- put that square in results
- if n < switches -> continue
- else, stop

=== ALGORITHM ===

brute force:
- initialize variable `lights` to an array with a length of the input and all elements set to false
- initialize variable `current` to 1
- while the current iteration is <= the input:
  - iterate over `lights`
  - change the value if the position is divisible by current iteration
- iterate over the lights
  - if the value is true;
    - add the position to the result
- return the result

using squares:
- initialize `result` to an empty array
- use for loop to iterate up from 1 while i ** 2 < input
  - push i ** 2 to `result`
- return result
*/

// brute force
function lightsOn(switches) {
  let lights = Array(switches).fill(false);
  let current = 1;
  
  while (current <= switches) {
    for (let i = 0; i < lights.length; i += 1) {
      if ((i + 1) % current === 0) {
        lights[i] = lights[i] === true ? false : true;
      }
    }
    current += 1
  }

  let result = [];

  for (let i = 0; i < lights.length; i += 1) {
    if (lights[i] === true) {
      result.push(i + 1);
    }
  }
  console.log(result);
  return result;
}

// using squares
function lightsOn(switches) {
  let result = [];

  for (let i = 1; i ** 2 <= switches; i += 1) {
    result.push(i ** 2);
  }

  console.log(result);
  return result;
}

lightsOn(5);        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
