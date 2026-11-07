/*
Implement a function timeoutPromise(promise, ms) that takes a promise and a timeout duration in milliseconds. If the promise resolves before the timeout, return its result. Otherwise, reject with the message "Operation timed out".

You can use the loadData function, which takes one second to resolve or reject, to test out your method.
*/

function loadData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() > 0.5) {
        resolve("Data loaded");
      } else {
        reject("Network error");
      }
    }, 1000);
  });
}

function timeoutPromise(promise, ms) {
  let timeout = new Promise((_, reject) => {
    setTimeout(() => reject('Operation timed out'), ms);
  });

  return Promise.race([timeout, promise]);
}

// Example usage:
timeoutPromise(loadData(), 500)
  .then(console.log)
  .catch(console.error);
// Expected output: "Operation timed out" (because it exceeds 500ms)
