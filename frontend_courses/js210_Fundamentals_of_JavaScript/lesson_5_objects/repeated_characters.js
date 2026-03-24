// Implement a function that takes a String as an argument and returns an object that contains a count of the repeated characters.
// Note that repeatedCharacters does a bit more than simply count the frequency of each character: it determines the counts, but only returns counts for characters that have a count of 2 or more. It also ignores the case.

function repeatedCharacters(string) {
  let result = {};

  for (let char of string) {
    let lowerCaseChar = char.toLowerCase();

    if (!(lowerCaseChar in result)) {
      result[lowerCaseChar] = 1;
    } else {
      result[lowerCaseChar] += 1;
    }
  }

  for (let key in result) {
    if (result[key] < 2) {
      delete result[key];
    }
  }

  console.log(result);
  return result;
}

repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }
