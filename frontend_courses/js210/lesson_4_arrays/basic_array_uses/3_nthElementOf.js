// Write a function that accepts two arguments, an array and an integer index position, and returns the element at the given index. Can you predict what happens if the index is greater than the length of the array? What about if it is a negative integer?

function nthElementOf(arr, index) {
  return arr[index];
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(nthElementOf(digits, 3));   // returns 16
console.log(nthElementOf(digits, 8));   // what does this return? (undefined)
console.log(nthElementOf(digits, -1));  // what does this return? (undefined)
