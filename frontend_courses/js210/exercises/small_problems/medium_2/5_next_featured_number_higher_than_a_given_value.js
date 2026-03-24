/*
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occurring exactly once each. For example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a function that takes an integer as an argument and returns the next featured number greater than the integer. Issue an error message if there is no next featured number.

NOTE: The largest possible featured number is 9876543201.
*/

const MAX_FEATURED = 9876543201;

function uniqueDigits(number) {
  let digits = String(number).split('');
  
  for (let i = 0; i < digits.length; i += 1) {
    if (digits.indexOf(digits[i]) !== i) {
      return false;
    }
  }

  return true;
}

function isFeatured(number) {
  return number % 2 > 0 && number % 7 === 0 && uniqueDigits(number);
}

function featured(number) {
  if (number >= MAX_FEATURED) {
    console.log('There is no possible number that fulfills those requirements.');
    return 'There is no possible number that fulfills those requirements.';
  }

  while (!isFeatured(number)) {
    number += 1;
  }

  console.log(number);
  return number;
}

featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
featured(9876543186);   // 9876543201
featured(9876543200);   // 9876543201
featured(9876543201);   // "There is no possible number that fulfills those requirements."
