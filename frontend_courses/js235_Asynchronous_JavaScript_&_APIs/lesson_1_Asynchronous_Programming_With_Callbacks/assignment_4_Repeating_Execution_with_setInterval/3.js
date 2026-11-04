/*
Write a program that does the following:

- Logs "Starting..." immediately.
- Every 2 seconds, logs "Hello!".
- After 10 seconds, stops logging "Hello!" and logs "Goodbye!".
*/

console.log('Starting...');

let intervalId = setInterval(() => {
  console.log('Hello!');
}, 2 * 1000);

setTimeout(() => {
  clearInterval(intervalId);
  console.log('Goodbye!')
}, 10 * 1000);
