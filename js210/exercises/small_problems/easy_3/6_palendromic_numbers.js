// Write a function that returns true if its integer argument is palindromic, or false otherwise. A palindromic number reads the same forwards and backwards.

function cleanString(string) {
  let regex = new RegExp(/[\s\W]/, 'g') // matches spaces and non-word characters
  return string.toLowerCase().replace(regex, '');
}

function reverseString(string) {
  return string.split('').reverse().join('');
}

function isRealPalindrome(string) {
  let newString = cleanString(string);
  return newString === reverseString(newString);
}

function isPalindromicNumber(number) {
  return isRealPalindrome(String(number));
}

isPalindromicNumber(34543);        // true
isPalindromicNumber(123210);       // false
isPalindromicNumber(22);           // true
isPalindromicNumber(5);            // true
