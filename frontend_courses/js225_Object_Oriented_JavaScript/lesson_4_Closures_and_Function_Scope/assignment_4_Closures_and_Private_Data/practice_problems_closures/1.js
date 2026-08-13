// Write a function named makeMultipleLister that, when invoked and passed a number, returns a function that logs every positive integer multiple of that number less than 100. Usage looks like this:

function makeMultipleLister(num) {
  return function() {
    let multiple = num;
    while (multiple < 100) {
      console.log(multiple);
      multiple += num;
    }
  }
}

let lister = makeMultipleLister(13);
lister();
// 13
// 26
// 39
// 52
// 65
// 78
// 91
