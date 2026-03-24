// Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

function repeater(string) {
  let result = '';
  
  for (let i = 0; i < string.length; i += 1) {
    result += string[i]
    result += string[i]
  }

  console.log(result);
  return result;
}

repeater('Hello');        // "HHeelllloo"
repeater('Good job!');    // "GGoooodd  jjoobb!!"
repeater('');             // ""
