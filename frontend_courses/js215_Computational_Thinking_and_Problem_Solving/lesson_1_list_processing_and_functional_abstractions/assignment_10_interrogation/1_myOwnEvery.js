// Write a function named myOwnEvery that's similar to the Array.prototype.every method. It should take an array and a function as arguments, and return true if every element passed to the function evaluates as truthy.

function myOwnEvery(array, func) {
  for(element of array) {
    if (!func(element)) return false;
  }

  return true;
}

let isAString = value => typeof value === 'string';
console.log(
  myOwnEvery(['a', 'a234', '1abc'], isAString)       // true
);
