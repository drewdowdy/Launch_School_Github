// Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

function sumSquareDifference(number) {
  let sum = 0;
  let squares = 0;
  
  for (let i = 1; i <= number; i += 1) {
    sum += i;
    squares += i ** 2;
  }

  console.log((sum ** 2) - squares);
  return (sum ** 2) - squares;
}

sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150
