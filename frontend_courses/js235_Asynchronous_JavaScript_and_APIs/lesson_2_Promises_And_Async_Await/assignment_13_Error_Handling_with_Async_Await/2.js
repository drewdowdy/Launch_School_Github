// Write an async function to provide the same behavior as our promise chain in this code:

function operation() {
  return new Promise((resolve) => {
    console.log("Operation started");
    setTimeout(() => {
      resolve("Operation complete");
    }, 1000);
  });
}

async function executeOperation() {
  try {
    let data = await operation();
    console.log(data);
  } finally {
    console.log('Cleaning up resources...');
  }
}

// operation()
//   .then(console.log)
//   // Logs: Operation complete
//   .finally(() => {
//     console.log("Cleaning up resources...");
//     // Always logs after operation completion
//   });

executeOperation();
