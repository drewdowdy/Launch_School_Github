// Rewrite loadData to use async / await. Then, show how we would utilize the function instead of the existing call to then:

// function loadData() {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => {
//       if (Math.random() > 0.5) {
//         resolve("Data loaded");
//       } else {
//         reject("Network error");
//       }
//     }, 1000);
//   }).catch(() => {
//     console.error("An error occurred. Attempting to recover...");
//     // Return a recovery promise
//     return Promise.resolve("Using cached data");
//   });
// }

async function asyncloadData() {
  try {
    let result = await new Promise((resolve, reject) => {
      setTimeout(() => {
        if (Math.random() > 0.5) {
          resolve('Data loaded');
        } else {
          reject('Network error');
        }
      }, 1000)
    });
    return result;
  } catch {
    console.error('An error occured. Attempting to recover...');
    return 'Using cached data';
  }
}

async function processData() {
  console.log(await asyncloadData());
}

processData();
// Logs "Data loaded" or "Using cached data"

