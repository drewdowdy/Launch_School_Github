// Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.

function rotateArray(array) {
  if (!Array.isArray(array)) return undefined;
  if (array.length === 0) return [];
  return array.slice(1).concat(array[0]);
}

function rotateRightmostDigits(number, n) {
  let stringDigits = String(number).split('')
  
  let lastDigits = stringDigits.slice(n * -1);
  let firstDigits = stringDigits.slice(0, stringDigits.length - n);

  let rotatedLastDigits = rotateArray(lastDigits);

  let rotatedNumber = Number(firstDigits.concat(rotatedLastDigits).join(''))

  console.log(rotatedNumber);
}

rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917
