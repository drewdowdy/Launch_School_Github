/*
Write a function named splice that accepts three arguments: an Array, a start index, and the number of values to remove. The function should remove values from the original Array, starting with the start index and removing the specified number of values. The function should return the removed values in a new Array.

You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.
*/

function splice(array, startIndex, numOfValues) {
  let spliceArray = [];
  let spliceIndex = 0;
  let originalLength = array.length;

  for (let i = startIndex; spliceArray.length < numOfValues; i++) {
    spliceArray[spliceIndex] = array[i];
    spliceIndex += 1;
    array[i] = array[i + numOfValues];
  }

  array.length = originalLength - numOfValues;
  return spliceArray;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]
