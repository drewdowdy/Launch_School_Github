// Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

// Example Output:
// Teddy is 69 years old!

function randomIntBetween(min, max) {
  const INCLUSIVE_OFFSET = 1;
  return Math.floor(Math.random() * (max - min + INCLUSIVE_OFFSET) + min);
}

let age = randomIntBetween(20, 200);

console.log(`Teddy is ${age} years old!`);
