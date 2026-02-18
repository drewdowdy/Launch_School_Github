/*
Write a function named pop that accepts one argument: an Array. The function should remove the last element from the array and return it.
*/

function pop(array) {
  let item = array[array.length - 1];
  array.length = array.length - 1;
  return item;
}

let count = [1, 2, 3];
console.log(pop(count));             // 3
console.log(count);                  // [ 1, 2 ]
