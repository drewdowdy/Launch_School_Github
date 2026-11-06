// Implement a function retryOperation that attempts to perform an operation by calling a provided function, operationFunc. If operationFunc throws an error, retryOperation should retry the operation up to two additional times before giving up and logging "Operation failed".

function retryOperation(operation, attempts=0) {
  operation()
  .then(() => console.log('Success!'))
  .catch(() => {
    if (attempts < 2) {
      return retryOperation(operation, attempts + 1);
    } else {
      console.log('Operation failed');
    }
  })
}

// Example usage:
retryOperation(
  () =>
    new Promise((resolve, reject) =>
      Math.random() > 0.33
        ? resolve("Success!")
        : reject(new Error("Fail!"))
    )
);
