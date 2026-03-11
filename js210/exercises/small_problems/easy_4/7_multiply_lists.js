// Write a function that takes two array arguments, each containing a list of numbers, and returns a new array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

function multiplyList(array1, array2) {
  let result = [];

  for (i = 0; i < array1.length; i += 1) {
    result.push(array1[i] * array2[i]);
  }

  console.log(result);
  return result;
}

multiplyList([3, 5, 7], [9, 10, 11]);    // [27, 50, 77]
