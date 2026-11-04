// Write a function processData that takes in two parameters: an array of numbers and a callback function. This function should use setTimeout to simulate a time-consuming computation by waiting 1 second. After the delay, the callback should be applied to each number in the array. Then, the new array should be logged.

function processData(array, callback) {
  setTimeout(() => {
    let result = array.map(e => callback(e));
    console.log(result);
  }, 1000);
}

// Example usage:
processData([1, 2, 3], (number) => number * 2);
// After 1 second, logs: [2, 4, 6]
