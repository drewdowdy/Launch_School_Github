// In the last assignment, we wrote our promise-based version of washLaundry. Expand upon this by rewriting the bakeCookies function from this assignment to use promises. Then, invoke the functions such that we start our laundry and then begin baking cookies.

function washLaundry() {
  console.log("Putting clothes in wash.");
  console.log("Adding soap.");

  console.log("Washing laundry...");
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log("Buzz!");
      resolve();
    }, 5000)
  })
}

washLaundry().then(() => {
  console.log("Folding Laundry.");
  console.log("Putting away Laundry.");
})

function bakeCookies() {
  return new Promise((resolve) => {
    console.log("Mixing ingredients.");
    console.log("Scooping cookie dough.");
    console.log("Putting cookies in oven.");
    
    console.log("Baking...");
    setTimeout(() => {
      console.log("Beep!");
      resolve();
    }, 3000)
  })
}
