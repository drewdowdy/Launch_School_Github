// Write a function like the previous one, except this time return the last count elements as a new array.

function lastNOf(arr, count) {
  let firstIndex = arr.length - count;
  return arr.slice(firstIndex);
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]
