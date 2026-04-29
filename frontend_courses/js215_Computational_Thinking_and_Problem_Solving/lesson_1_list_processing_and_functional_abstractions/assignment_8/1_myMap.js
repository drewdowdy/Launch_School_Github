// Write a Function named myMap that is similar to the built-in Array.prototype.map method. Your Function should take an array and another Function (the callback) as arguments, and return a new Array. The new Array's values should be the return values of the callback Function.

function myMap(array, func) {
  let result = [];

  for (element of array) {
    result.push(func(element));
  }

  return result;
}

let plusOne = n => n + 1;

console.log(
  myMap([1, 2, 3, 4], plusOne)       // [ 2, 3, 4, 5 ]
);
