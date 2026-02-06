const DIGITS = {
  1: '1',
  2: '2',
  3: '3',
  4: '4',
  5: '5',
  6: '6',
  7: '7',
  8: '8',
  9: '9',
  0: '0',
}

function integerToString(int) {
  if (int === 0) {
    return '0';
  }

  let result = '';

  while (int > 0) {
    num = int % 10;
    str = DIGITS[num];

    result = num + result;

    int = (int - num) / 10;
  }

  return result;
}

function signedIntegerToString(int) {
  let result;
  
  if (int > 0) {
    result = '+' + integerToString(int);
  } else if (int < 0) {
    result = '-' + integerToString(int * -1);
  } else {
    result = integerToString(int);
  }

  return result;
}

console.log(signedIntegerToString(4321)); // "+4321"
console.log(signedIntegerToString(-123)); // "-123"
console.log(signedIntegerToString(0));    // "0"
console.log(signedIntegerToString(-0));   // "0"
