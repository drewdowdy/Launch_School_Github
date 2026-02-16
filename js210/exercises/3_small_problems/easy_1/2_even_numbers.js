// Log all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

for (let num = 2; num < 100; num += 2) {
  console.log(num);
}

for (let i = 1; i < 100; i += 1) {
  if (i % 2 === 1) {
    continue; // move to the next iteration
  }

  console.log(i);
}
