// Write a function that takes a non-empty string argument and returns the middle character(s) of the string. If the string has an odd length, you should return exactly one character. If the string has an even length, you should return exactly two characters.

function centerOf(string) {
  let mid = Math.floor((string.length - 1) / 2);
  let centerChar = string[mid];

  if (string.length % 2 === 0) centerChar += string[mid + 1];

  console.log(centerChar);
  return centerChar;
}

centerOf('I Love JavaScript'); // "a"
centerOf('Launch School');     // " "
centerOf('Launch');            // "un"
centerOf('Launchschool');      // "hs"
centerOf('x');                 // "x"
