// Consider the output below:
// Implement a function countdown that uses an IIFE to generate the desired output.

function countdown(num) {
  (function(start) {
    for (let i = start; i >= 0; i--) {
      console.log(i);
    }
    console.log('Done!');
  })(num)
}

countdown(7);
// 7
// 6
// 5
// 4
// 3
// 2
// 1
// 0
// Done!
