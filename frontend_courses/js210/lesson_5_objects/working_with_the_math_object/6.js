// Math.random returns a random floating-point number between 0 and 1, excluding the exact value of 1. This isn't helpful on its own, since you usually want a random integer between two other integer values. Create a function that takes two arguments, a minimum and a maximum value, and returns a random integer between those numbers (including both of the numbers). Your solution should handle the scenario that the user inadvertently swaps the positions of the min and max values or the scenario that the min and max values are equal. You may assume that the user always provides the min and max values.

/*
1. get random int from 0 to 0.999
2. multiply (max - min) to get number that is 0 <= x < max (add one to make inclusive)
3. add the min back to shift result to be min <= x < max
*/

function randomInt(min, max) {
  if (max < min) {
    [min, max] = [max, min]; 
  } else if (min === max) {
    return min;
  }

  return Math.floor(Math.random() * (max - min + 1) + min)
}

console.log(randomInt(0, 5));
console.log(randomInt(10, 20));
console.log(randomInt(5, 5)); // same min & max
console.log(randomInt(5, 1)); // min & max switched
