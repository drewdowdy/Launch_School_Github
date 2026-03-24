/*
Write a function named shift that accepts one argument: an Array. The function should remove the first value from the beginning of the Array and return it.
*/

function shift(array) {
  let value = array[0];

  for (let i = 0; i < array.length - 1; i++) {
    array[i] = array[i + 1]; // shift values left
  }

  array.length = array.length - 1; // chop off last element
  return value;
}

let count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]
