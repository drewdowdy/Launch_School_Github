// Create a makeCounterLogger function that takes a number as an argument and returns a function. When we invoke the returned function with a second number, it should count up or down from the first number to the second number, logging each number to the console:

function makeCounterLogger(start) {
  return function(end) {
    if (end > start) {
      for (let n = start; n <= end; n++) {
        console.log(n);
      }
    } else if (end < start) {
      for (let n = start; n >= end; n--) {
        console.log(n);
      }
    }
  }
}

let countlog = makeCounterLogger(5);
countlog(8);
// 5
// 6
// 7
// 8
countlog(2);
// 5
// 4
// 3
// 2
