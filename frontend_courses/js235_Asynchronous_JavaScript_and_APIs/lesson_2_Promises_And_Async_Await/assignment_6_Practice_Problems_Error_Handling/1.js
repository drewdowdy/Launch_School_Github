// Create a function called flakyService that simulates a service that sometimes fails. The function should return a promise that resolves with "Operation successful" or rejects with "Operation failed" randomly. Use .then() for a successful operation log and .catch() for logging a failed operation.

function flakyService() {
  let rand = Math.random();

  return new Promise((resolve, reject) => {
    if (rand < 0.5) {
      resolve('Success!');
    } else {
      reject('Rejected!');
    }
  })
}

flakyService()
  .then((successMsg) => console.log(successMsg))
  .catch((errorMsg) => console.log(errorMsg))
