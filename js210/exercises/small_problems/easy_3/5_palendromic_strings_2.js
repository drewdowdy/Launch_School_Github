// Write another function that returns true if the string passed as an argument is a palindrome, or false otherwise. This time, however, your function should be case-insensitive, and should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the isPalindrome function you wrote in the previous exercise.

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

isRealPalindrome('madam');               // true
isRealPalindrome('Madam');               // true (case does not matter)
isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
isRealPalindrome('356653');              // true
isRealPalindrome('356a653');             // true
isRealPalindrome('123ab321');            // false
