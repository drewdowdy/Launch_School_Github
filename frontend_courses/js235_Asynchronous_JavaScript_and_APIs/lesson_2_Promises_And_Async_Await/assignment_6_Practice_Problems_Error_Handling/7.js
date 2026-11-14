// Implement a loadData function that fetches data but sometimes fails. It should return a promise that either fulfills with "Data loaded" or rejects with "Network error". Use a .catch() block to return a recovery promise that resolves with "Using cached data" in case of failure.

function loadData() {
  return new Promise((resovle, reject) => {
    setTimeout(() => {
      if (Math.random() < 0.5) {
        resovle('Data loaded');
      } else {
        reject('Network error');
      }
    }, 1000)
  }).catch((error) => {
    console.log(error);
    return Promise.resolve('Using cached data');
  })
}

loadData().then(console.log);
