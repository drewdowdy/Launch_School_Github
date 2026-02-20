// Write a function that takes a sorted array of integers as an argument, and returns an array that includes all the missing integers (in order) between the first and last elements of the argument.

function missing(arr) {
  let missingArr = [];
  let currentValue = arr[0];
  let lastValue = arr[arr.length - 1];

  while (currentValue < lastValue) {
    if (arr.indexOf(currentValue) === -1) {
      missingArr.push(currentValue);
    }
    currentValue += 1;
  }

  console.log(missingArr);
  return missingArr;
}

missing([-3, -2, 1, 5]);                  // [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]);                    // []
missing([1, 5]);                          // [2, 3, 4]
missing([6]);                             // []
