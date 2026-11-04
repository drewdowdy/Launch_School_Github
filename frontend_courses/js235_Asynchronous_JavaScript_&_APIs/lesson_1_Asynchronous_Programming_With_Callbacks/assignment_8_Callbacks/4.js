// Build a function waterfallOverCallbacks that chains the execution of multiple callbacks. This function should take an array of callbacks and an initial value as arguments. The main function should pass the return value of each callback to the next callback in the array, using the initial value as the argument to the first callback.

function waterfallOverCallbacks(callbacks, initial) {
  let result = initial;
  callbacks.forEach(callback => result = callback(result));
  console.log(result);
}

// Example usage:
const double = (x) => x * 2;
waterfallOverCallbacks([double, double, double], 1);
// Logs: 8
