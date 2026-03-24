/*
Write a function indexOf that accepts two arguments: an array and a value. The function returns the first index at which the value can be found, or -1 if the value is not present.
*/

function indexOf(array, element) {
  for (let i = 0; i < array.length; i++) {
    if (array[i] === element) {
      return i;
    }
  }

  return -1;
}

console.log(indexOf([1, 2, 3, 3], 3));         // 2
console.log(indexOf([1, 2, 3], 4));            // -1
