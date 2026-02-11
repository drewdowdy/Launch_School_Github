/*
Write a function named checkGoldbach that uses Goldbach's Conjecture to log every pair of primes that sum to the number supplied as an argument. The conjecture states that "you can express every even integer greater than 2 as the sum of two primes". The function takes as its only parameter, an integer expectedSum, and logs all combinations of two prime numbers whose sum is expectedSum. Log the prime pairs with the smaller number first. If expectedSum is odd or less than 4, your function should log null.

Your checkGoldbach function may call the isPrime function you wrote for a previous practice problem.

Example

checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
*/

function isPrime(number) {
  if (number < 1) return false;
  
  for (let divisor = 2; divisor < number; divisor++) {
    if (number % divisor === 0) return false;
  }

  return true
}

function checkGoldbach(expectedSum) {
  if (expectedSum < 4 || expectedSum % 2 !== 0) {
    console.log(null);
    return;
  }

  let primes = [];

  for (let num = 2; num < expectedSum; num++) {
    if (isPrime(num)) {
      primes.push(num);
    }
  }

  let sumPairs = [];

  primes.forEach(prime => {
    let complement = expectedSum - prime;

    if (prime <= complement && primes.includes(complement)) {
      sumPairs.push([prime, complement]);
    }
    
  })

  sumPairs.forEach(pair => {
    console.log(`${pair[0]} ${pair[1]}`);
  })
}

checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
