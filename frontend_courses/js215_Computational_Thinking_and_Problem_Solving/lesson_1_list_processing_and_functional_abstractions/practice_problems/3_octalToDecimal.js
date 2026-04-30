// Write a Function named octalToDecimal that performs octal to decimal conversion. When invoked on a String that contains the representation of an octal number, the Function returns a decimal version of that value as a Number. Implement the conversion yourself: do not use something else to perform the conversion for you.

/*
Tasks:
- split decimal num into digits
- change each digit by multiplying it by 8 raised to the digit position (map)
- sum up all of the multiplications (reduce)
*/

const toNumber = (numString) => parseInt(numString, 10);

const digits = (string) => {
  return string
    .split('')
    .map(toNumber);
};

const octalPower = (pos, num) => num * (8 ** pos);
const sum = (total, num) => total + num;

function octalToDecimal(numberString) {
  return digits(numberString)
    .map((digit, i) => octalPower(numberString.length - i - 1, digit))
    .reduce(sum, 0);
}

// alternative
function octalToDecimal(numberString) {
  return numberString.split('').reduce((sum, current, idx) => {
    let number = parseInt(current);
    let numPosition = numberString.length - idx - 1
    let octal = number * (8 ** numPosition);

    return sum + octal;
  }, 0);
}

console.log(
  octalToDecimal('1'),    // 1
  octalToDecimal('10'),   // 8
  octalToDecimal('130'),  // 88
  octalToDecimal('17'),   // 15
  octalToDecimal('2047'), // 1063
  octalToDecimal('011')   // 9
);
