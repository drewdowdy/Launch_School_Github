/*
Write a function that takes two arguments:

a string to be split
a delimiter character

The function logs the split strings to the console, as shown below:

Example:

function splitString(string, delimiter) {
  // …
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
*/

function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log('ERROR: No delimiter');
    return;
  }

  if (delimiter === '') {
    for (let i = 0; i < string.length; i += 1) {
      console.log(string[i]);
    }
    return;
  }

  let result = [];
  let startIndex = 0;

  for (let i = 0; i < string.length; i += 1) {
    if (string[i] === delimiter) {
      result.push(string.slice(startIndex, i));
      startIndex = i + 1;
    }
  }

  result.push(string.slice(startIndex, string.length));

  result.forEach(section => {
    console.log(section);
  })
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
