// The following program is expected to log each number between 0 and 9 (inclusive) that is a multiple of 3. Read through the code shown below. Will it produce the expected result? Why or why not?

let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } 
  
  // else {
    // i += 1;
  // }

  i += 1;
}

// This won't work because the if branch checks if i is a multiple of 3, logs i, then never increments i. So in the following iterations, the same value for i will be logged infinitely. Since 0 % 3 is also 0, `0` will be logged to the console infinitely.

// The solution is to remove the else branch of the if statement and increment the value of i every time.
