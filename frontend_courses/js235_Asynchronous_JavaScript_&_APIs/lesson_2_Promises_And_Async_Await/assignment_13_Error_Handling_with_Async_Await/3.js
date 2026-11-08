// Update retryOperation to use async / await:

// function retryOperation(operationFunc) {
//   let attempts = 0;

//   function attempt() {
//     return operationFunc().catch((err) => {
//       if (attempts < 2) {
//         attempts++;
//         console.log(`Retry attempt #${attempts}`);
//         return attempt();
//       } else {
//         throw err;
//       }
//     });
//   }

//   return attempt().catch(() => console.error("Operation failed"));
// }

async function retryOperation(operationFunc) {
  let attempts = 0;

  async function attempt() {
    try {
      return await operationFunc()
    } catch(err) {
      if (attempts < 2) {
        attempts++;
        console.log(`Retry attempt #${attempts}`);
        return attempt();
      } else {
        throw err;
      }
    }
  }

  try {
    console.log(await attempt());
  } catch {
    console.error('Operation failed');
  }
}
