// Update retryNTimes to use async / await instead of promise chains. Before starting, consider whether updating this function to use async / await will change how we use it. Will doing so break our existing code? It shouldn't! The function signature stays the same. Remember, async / await is syntactical sugar that makes promises sweeter to work with.

function retryNTimes(fn, n, ...args) {
  let attempts = 0;

  function attempt() {
    console.log(`Attempt number: ${attempts + 1}`);
    return fn(...args)
      .then((data) => data) // Resolve if successful
      .catch((error) => {
        if (attempts >= n) {
          return Promise.reject(error); // Reject if max attempts reached
        }
        attempts++;
        return attempt(); // Retry
      });
  }

  return attempt();
}

async function asyncRetryNTimes(fn, n, ...args) {
  let attempts = 0;

  while (attempts <= n) {
    try {
      console.log(`Attempt number: ${attempts + 1}`);
      return await fn(...args);
    } catch(error) {
      if (attempts >= n) {
        throw error;
      }
      attempts++;
    }
  }
}
