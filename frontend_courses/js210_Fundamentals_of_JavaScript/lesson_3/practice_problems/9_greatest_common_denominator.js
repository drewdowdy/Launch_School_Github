/*
Create a function that computes the Greatest Common Divisor of two positive integers.

Example

gcd(12, 4);   // 4
gcd(15, 10);  // 5
gcd(9, 2);    // 1
*/

function gcd(num1, num2) {
  while (num1 !== num2)  {
    if (num1 - num2 > 0) {
      num1 -= num2
    } else if (num2 - num1 > 0) {
      num2 -= num1;
    }
  }

  return num1;
}

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
