// Continuing with our chores example, expand upon the previous problem to complete our "after laundry" and "after cookies" actions once each task has been completed. Write a doChores function that manages both washLaundry and bakeCookies.

function doChores() {
  console.log("Starting the chores...");

  washLaundry().then(() => {
    console.log("Folding Laundry.");
    console.log("Putting away Laundry.");
  })

  bakeCookies().then(() => {
    console.log("Cooling cookies.");
    console.log("Eating cookies.");
  })
}

doChores();
