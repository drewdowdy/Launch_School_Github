// Using the function from the previous problem, what happens if you pass a count greater than the length of the array? How can you fix the function so it returns a new instance of the entire array when count is greater than the array length?

function lastNOf(arr, count) {
  if (count > arr.length) {
    return arr.slice() // return a copy of input
  }

  let index = arr.length - count;
  return arr.slice(index);
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(lastNOf(digits, 3));    // returns [16, 23, 42]
console.log(lastNOf(digits, 10));    // returns [16, 23, 42]

