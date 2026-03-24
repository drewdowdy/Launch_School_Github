// In the previous exercise, we developed a recursive solution for computing the nth Fibonacci number. In a language that is not optimized for recursion, some (but not all) recursive functions can be extremely slow and may require massive quantities of memory and/or stack space. If you tested for bigger nth numbers, you might have noticed that getting the 50th fibonacci number already takes a significant amount of time.

// Fortunately, every recursive function can be rewritten as a non-recursive (or procedural) function.

// Rewrite your recursive fibonacci function so that it computes its results without using recursion.

function fibonacci(number) {
  if (number === 1 || number === 2) {
    return 1;
  }
  
  let previous = [1, 1];
  let fibonacci = 0;

  for (let count = 2; count < number; count += 1) {
    fibonacci = previous.reduce((accum, n) => accum + n);
    previous = [previous[1], previous[0] + previous[1]];
  }

  console.log(fibonacci);
  return fibonacci;
}

fibonacci(20);       // 6765
fibonacci(50);       // 12586269025
fibonacci(75);       // 2111485077978050
