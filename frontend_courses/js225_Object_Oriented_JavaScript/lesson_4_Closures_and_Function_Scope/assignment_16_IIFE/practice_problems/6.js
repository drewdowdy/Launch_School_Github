// For an extra challenge, refactor the solution to problem 4 using recursion, bearing in mind that a named function created in an IIFE can be referenced inside of the IIFE.

function countdown(num) {
  (function recursiveSub(start) {
    console.log(start);

    if (start === 0) {
      console.log('Done!');
    } else {
      recursiveSub(start - 1);
    }
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

