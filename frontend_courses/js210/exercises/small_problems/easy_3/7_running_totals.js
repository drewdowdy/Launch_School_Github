// Write a function that takes an array of numbers and returns an array with the same number of elements, but with each element's value being the running total from the original array.

// function runningTotal(array) {
//   let currentTotal = 0;
//   let resultArray = [];

//   for (let i = 0; i < array.length; i += 1) {
//     currentTotal += array[i];
//     resultArray.push(currentTotal);
//   }

//   console.log(resultArray);
//   return resultArray;
// }

// using Array.prototype.map()
function runningTotal(array) {
  let currentTotal = 0;
  let result = array.map((number) => currentTotal += number);

  console.log(result);
  return result;
}

runningTotal([2, 5, 13]);             // [2, 7, 20]
runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
runningTotal([3]);                    // [3]
runningTotal([]);                     // []
