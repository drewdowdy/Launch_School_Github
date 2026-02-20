// Write a function that takes an array argument and returns a new array that contains all the argument's elements in their original order followed by all the argument's elements in reverse order.

function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}

console.log(mirroredArray([1, 2, 3]))  // [1, 2, 3, 3, 2, 1] 
console.log(mirroredArray(['a', 'b'])) // ['a', 'b', 'b', 'a'] 
