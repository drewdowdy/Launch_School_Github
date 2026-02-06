const DIGITS = {
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '0': 0,
}

function stringToInteger(str) {
  let result = 0;
  let digit_regex = /[0-9]/;

  for (let i = 0; i < str.length; i += 1) {
    if (str[i].match(digit_regex)) {
      result = (result * 10) + DIGITS[str[i]]
    }
  }

  return result;
}

function stringToSignedInteger(str) {
  switch (str[0]) {
    case '-': return -stringToInteger(str.slice(1));
    case '+': return stringToInteger(str.slice(1));
    default: return stringToInteger(str); 
  }
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100
