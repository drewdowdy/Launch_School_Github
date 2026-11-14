// Convert the downloadFilePromise function you saw previously to an asynchronous function named asyncDownloadFile. Utilize await to pause execution until the file download completes before logging the success message.

function downloadFilePromise() {
  return new Promise((resolve) => {
    console.log("Downloading file...");
    setTimeout(() => {
      resolve("Download complete!");
    }, 1500);
  });
}

async function asyncDownloadFile() {
  console.log("Downloading file...");
  
  let message = await new Promise((resolve) => {
    setTimeout(() => {
      resolve("Download complete!");
    }, 1500);
  });

  console.log(message);
}