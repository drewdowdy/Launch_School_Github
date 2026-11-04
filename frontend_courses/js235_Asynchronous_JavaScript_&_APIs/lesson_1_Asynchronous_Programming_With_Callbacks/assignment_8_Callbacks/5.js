// Consider the function startCounter that accepts a callback. It should use setInterval to call the callback every second, incrementing and logging a counter variable each time. Also, provide a way for the callback to stop the counter after reaching a specified value.

function startCounter(callback) {
  let count = 0
  let intervalId = setInterval(() => {
    count++;
    if (callback(count)) clearInterval(intervalId);
  }, 1000);
}

// Example usage:
startCounter((count) => {
  console.log(count);
  return count === 5;
});
// Logs 1, 2, 3, 4, 5, then stops
