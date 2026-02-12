/*
Write a function that returns a substring of a string based on a starting index and length.

- The start argument is the starting index. If negative, treat it as strLength + start where strLength is the length of the string. For example, if start is -3, treat it as strLength - 3.
- The length argument is the maximum length of the desired substring. If length exceeds the number of characters available, just use the available characters.

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
*/

function substr(string, start, length) {
  // account for negative lengths
  if (length <= 0) {
    console.log('"' + '' + '"');
    return '';
  }

  // account for negative indices
  if (start < 0) {
    start = start + string.length;
  }

  // account for too long lengths
  if (start + length > string.length) {
    length = string.length - start;
  }

  let substring = '';

  for (; length > 0; length -= 1) {
    substring += string[start];
    start += 1;
  }

  console.log('"' + substring + '"');
  return substring;
}

let string = 'hello world';

// substr(string, 2, 4);      // "llo "
// substr(string, -3, 2);     // "rl"
substr(string, 8, 20);     // "rld"
// substr(string, 0, -20);    // ""
// substr(string, 0, 0);      // ""