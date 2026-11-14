// Imagine a situation where you must clean up resources (e.g., close a file) whether an operation succeeds or fails. Create a promise that resolves with "Operation complete" and demonstrate how to perform cleanup after the operation completes using .finally().

function executeOperation() {
  let rand = Math.random();

  return new Promise((resolve, reject) => {
    if (rand < 0.5) {
      resolve('Operation successful.');
    } else {
      reject('Something went wrong.');
    }
  })
}

executeOperation()
  .then((success) => console.log(success))
  .catch((error) => console.log(error))
  .finally(() => console.log('Cleaning up, closing files.'));
