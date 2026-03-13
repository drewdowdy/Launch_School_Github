// Write a function that takes a string as an argument and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.

function swapCase(string) {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    let currentChar = string[i];

    if (/[a-z]/.test(currentChar)) {
      result += currentChar.toUpperCase();
    } else if (/[A-Z]/.test(currentChar)) {
      result += currentChar.toLowerCase();
    } else {
      result += currentChar;
    }
  }

  console.log(result);
  return result;
}

swapCase('CamelCase');              // "cAMELcASE"
swapCase('Tonight on XYZ-TV');      // "tONIGHT ON xyz-tv"
