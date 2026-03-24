// Write a function that takes an array, and returns a new array with duplicate elements removed.

function uniqueElements(arr) {
  let uniqueArr = [];

  for (let i = 0; i < arr.length; i++) {
    if (uniqueArr.includes(arr[i])) {
      continue;
    } else {
      uniqueArr.push(arr[i]);
    }
  }

  return uniqueArr;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]
