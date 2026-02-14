/*
Write two functions that each take two strings as arguments. Their expected behaviors are as follows:

The indexOf function searches for the first instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.

The lastIndexOf function searches for the last instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.

Both functions return -1 if firstString does not contain the substring specified by secondString.

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.

=== PROBLEM ===

Write two functions; indexOf() and lastIndexOf().

indexOf() returns the index of the first instance of a substring that is passed in as an argument. Should return -1 if no such index exists

lastIndexOf() returns the index of the LAST instance of a substring. Also returns -1 if no such index.

Rules:
- case sensitive
- when a substring is found, return the index where the substring starts
- can use bracket notation and length property (no other properties or methods)

=== DATA ===

Input: search string, substring
Intermediate:
- for loop to iterate through search string
Output: number of the index where the substring is

=== BRAINSTORM ===

iterate through the search string and match current substring to substring argument

*/

function makeSubstring(string, index, size) {
  if (size === undefined) {
    size = string.length - index;
  }
  
  let result = '';

  for (; result.length < size; index += 1) {
    result += string[index];
  }

  return result;
}

// console.log(makeSubstring('hello', 1, 4)); // ell
// console.log(makeSubstring('hello there!', 1)); // ello there!

function indexOf(firstString, secondString) {
  let finalIndex = firstString.length - secondString.length;

  for (let i = 0; i <= finalIndex; i += 1) {
    let currentSubstring = makeSubstring(firstString, i, secondString.length)

    if (currentSubstring === secondString) {
      return i;
    }
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  let lastIndex;

  while (true) {
    lastIndex = indexOf(firstString, secondString);

    if (lastIndex >= 0) {
      firstString = makeSubstring(firstString, lastIndex + 1)
    } else {
      break;
    }
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  let firstIndex = firstString.length - secondString.length;

  for (let i = firstIndex; i >= 0; i -= 1) {
    currentSubstring = makeSubstring(firstString, i, secondString.length)

    if (currentSubstring === secondString) {
      return i;
    }
  }

  return -1;
}



/*
=== PROBLEM ===

Created lastIndexOf() function that uses the logic of indexOf() in its definition

=== BRAINSTORM ===

use a while loop with a break condition
search for a first index of
  if found:
    search again from indexof() + 1
    ...
    if index becomes > string.length:
      return -1
  else:
    return -1
*/



// console.log(indexOf('Some strings', 's'));    // 5
// console.log(indexOf('Blue Whale', 'Whale'));  // 5
// console.log(indexOf('Blue Whale', 'Blute'));  // -1
// console.log(indexOf('Blue Whale', 'leB'));    // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
