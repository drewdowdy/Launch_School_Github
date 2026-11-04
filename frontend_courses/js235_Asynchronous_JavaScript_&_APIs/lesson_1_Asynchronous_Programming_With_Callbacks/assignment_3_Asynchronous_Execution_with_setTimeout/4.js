// Write a function named afterNSeconds that takes two arguments: a callback and a time duration in seconds. The function should wait for the indicated period and then invoke the callback function.

function afterNSeconds(callback, seconds) {
  setTimeout(callback, seconds * 1000);
}
