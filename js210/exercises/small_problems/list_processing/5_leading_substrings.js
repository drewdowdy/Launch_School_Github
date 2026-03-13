// Write a function that takes a string argument and returns a list of substrings of that string. Each substring should begin with the first letter of the word, and the list should be ordered from shortest to longest.

function leadingSubstrings(string) {
  let result = [];
  let stringArr = string.split('');

  for (let i = 0; i < string.length; i += 1) {
    let substring = stringArr.slice(0, i + 1).join('');
    result.push(substring);
  }

  console.log(result);
  return result;
}

leadingSubstrings('abc');      // ["a", "ab", "abc"]
leadingSubstrings('a');        // ["a"]
leadingSubstrings('xyzzy');    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
