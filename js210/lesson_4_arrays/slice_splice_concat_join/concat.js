/*
Write a function named concat that accepts two Array arguments. The function should return a new Array that contains the values from each of the original Arrays.

You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.
*/

function concat(array1, array2) {
  let newArray = [];
  let newArrayIndex = 0;

  for (let i = 0; i < array1.length; i++) {
    newArray[newArrayIndex] = array1[i];
    newArrayIndex++;
  }
  
  for (let i = 0; i < array2.length; i++) {
    newArray[newArrayIndex] = array2[i];
    newArrayIndex++;
  }

  return newArray
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
