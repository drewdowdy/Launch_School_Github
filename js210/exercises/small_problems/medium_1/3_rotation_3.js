// Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175. Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally, keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.

/*
735291
352917
329175
321759
321597
321579
*/

// Write a function that takes an integer as an argument and returns the maximum rotation of that integer. You can (and probably should) use the rotateRightmostDigits function from the previous exercise.

function rotateArray(array) {
  if (!Array.isArray(array)) return undefined;
  if (array.length === 0) return [];
  return array.slice(1).concat(array[0]);
}

function rotateRightmostDigits(number, n) {
  let stringDigits = String(number).split('');
  let lastDigits = stringDigits.slice(n * -1);
  let firstDigits = stringDigits.slice(0, stringDigits.length - n);

  let rotatedLastDigits = rotateArray(lastDigits);
  let rotatedNumber = Number(firstDigits.concat(rotatedLastDigits).join(''));

  return rotatedNumber;
}

function maxRotation(number) {
  for (let i = String(number).length; i > 1; i -= 1) {
    number = rotateRightmostDigits(number, i);
  }

  console.log(number);
  return number
}

maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845
