/*
A double number is an even-length number whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, and 7676 are all double numbers, whereas 444, 334433, and 107 are not.

Write a function that returns the number provided as an argument multiplied by two, unless the argument is a double number, in which case, return the double number as-is.
*/

function isDouble(number) {
  let numberString = String(number);

  if (numberString.length % 2 === 0) {
    let halfway = numberString.length / 2;
    let firstHalf = numberString.slice(0, halfway);
    let secondHalf= numberString.slice(halfway);

    return firstHalf == secondHalf;
  } else {
    return false;
  }
}

function twice(number) {
  if (isDouble(number)) {
    console.log(number);
    return number;
  } else {
    console.log(number * 2);
    return number * 2;
  }
}

twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676
