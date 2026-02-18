/*
Create a function that returns the contents of the array it receives as an argument, but with the values in reversed order. Your function should use a for loop that iterates over the elements in the array from the end of the array to the beginning, and pushes each element's value to a new result array. Be sure to start your loop with the element whose index is one less than the input array's length.
*/

function reverse(array) {
  reversedArray = [];

  for (let i = array.length - 1; i >= 0; i -= 1) {
    reversedArray.push(array[i]);
  }

  return reversedArray;
}

console.log(reverse([1, 2, 3]));
