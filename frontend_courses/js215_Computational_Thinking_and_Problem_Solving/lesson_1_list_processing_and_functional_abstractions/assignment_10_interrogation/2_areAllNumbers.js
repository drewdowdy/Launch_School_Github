// Let's write a program that checks whether all elements of an array are Numbers.

function myOwnEvery(array, func) {
  for(element of array) {
    if (!func(element)) return false;
  }

  return true;
}

function areAllNumbers(array) {
  return myOwnEvery(array, isANumber);
}

function isANumber(value) {
  return typeof value === 'number' && !Number.isNaN(value);
}

areAllNumbers([1, 5, 6, 7, '1']);             // false
areAllNumbers([1, 5, 6, 7, 1]);               // true
areAllNumbers([1, 5, 6, 7, NaN]);             // false
