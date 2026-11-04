// Write a JavaScript function named delayLog that loops through the numbers from 1 to 10, and logs each number after that number of seconds. It should log 1 after 1 second, 2 after 2 seconds, etc. Note that the computation of the time is not dependent on when a previous number was logged. This means that for 10 numbers, a total of 10 seconds would have passed.

function makeLogger(n) {
  return function() {
    console.log(n);
  }
}

function delayLog() {
  for (let i = 1; i <= 10; i++) {
    setTimeout(makeLogger(i), i * 1000);
  }
}

delayLog();
// > 1  // 1 second later
// > 2  // 2 seconds later
// > 3  // 3 seconds later
// > 4  // etc...
// > 5
// > 6
// > 7
// > 8
// > 9
// > 10

/*
Explanation: The logic of delayLog() is executed almost instantly, but all of the setTimeout invocations are all scheduled with their relative times. and when they all execute, we see that each console log appears 1 second after the other since each log is seperated by 1000ms
*/
