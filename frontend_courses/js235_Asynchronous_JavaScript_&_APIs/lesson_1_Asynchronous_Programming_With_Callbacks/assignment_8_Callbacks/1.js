// Write a function basicCallback that receives a callback function and a numeric argument. This function should execute the callback after 2 seconds, passing it the number it received as an argument.

function basicCallback(callback, n) {
  setTimeout(function() {
    callback(n);
  }, 2000);
}

// Example usage:
basicCallback((number) => {
  console.log(number * 2);
}, 5);
// After 2 seconds, logs: 10
