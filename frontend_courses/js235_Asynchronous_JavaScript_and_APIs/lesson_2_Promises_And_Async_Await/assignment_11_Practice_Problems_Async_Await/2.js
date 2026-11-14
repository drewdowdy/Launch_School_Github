// Create a processNTimes function that takes an array of numbers, a callback, and a number, n, as an argument. The function should utilize the processDataPromise function we wrote before and apply it to the input array of numbers n times. Here's an example:

function processDataPromise(numbers, callback) {
  return new Promise((resolve) => {
    setTimeout(() => {
      const processed = numbers.map(callback);
      resolve(processed);
    }, 1000);
  });
}

async function processNTimes(numArr, callback, n) {
  while (n > 0) {
    numArr = await processDataPromise(numArr, callback);
    n--;
  }

  console.log(numArr);
}

// Example usage:
const squareIt = (n) => n * n;
processNTimes([1, 2, 3], squareIt, 3);
// After 3 seconds, logs: [1, 256, 6561]
