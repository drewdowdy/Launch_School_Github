// The penultimate function takes a string as an argument and returns the next-to-last word in the string. The function assumes that "words" are any sequence of non-whitespace characters. The function also assumes that the input string will always contain at least two words. The penultimate function in the example below does not return the expected result. Run the code below, check the current result, identify the problem, explain what the problem is, and provide a working solution.

// function penultimate(string) {
//   return string.split(' ')[-2];
// }

function penultimate(string) {
  let words = string.split(' ');
  let penultimateIndex = words.length - 2;
  
  return words[penultimateIndex];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"

/*
This function will always return undefined becasue we can't access the next to last element of an array with a negative index. JS looks for an element in the array object with the key '-2' and no such key exists so undefined is returned.
To fix this, we can use the length property and subtract two to get the penultimate element of the array.
*/
