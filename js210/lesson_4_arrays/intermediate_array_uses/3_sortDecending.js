// Use the array sort method to create a function that takes an array of numbers and returns a new array of the numbers sorted in descending order. Do not alter the original array.

function sortDescending(arr) {
  let decendingArr = [];
  let highestValue = arr[0];

  while (decendingArr.length !== arr.length) {
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] > highestValue) {
        highestValue = arr[i]
      }
    }

    decendingArr.push(highestValue);
  }
}

let array = [23, 4, 16, 42, 8, 15];
let result = sortDescending(array);
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]
