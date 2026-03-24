// Write a function that takes an array of numbers and returns the sum of the sums of each leading subsequence in that array. Examine the examples to see what we mean. You may assume that the array always contains at least one number.

function sumOfSums(numArray) {
  let result = [];

  for (let i = 0; i < numArray.length; i += 1) {
    let currentSlice = numArray.slice(0, i + 1);
    result.push(currentSlice.reduce((accum, num) => accum += num));
  }

  return result.reduce((accum, num) => accum += num);
}

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
