/*
Write a function that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.
*/

// function crunch(string) {
//   let result = string ? string[0] : '';

//   for (let i = 1; i < string.length; i += 1) {
//     if (string[i - 1] === string[i]) {
//       continue;
//     } else {
//       result += string[i];
//     }
//   }

//   return result;
// }

// Further Exploration
// use a regex

const crunch = (string) => string.replace(/(.)\1+/g, '$1');

/*
| Pattern | Explanation                                    |
|---------|------------------------------------------------|
| (.)     | match any single character                     |
| \1      | matches the result of capture group 1          |
| +       | one or more instances of the preceeding match  |
| g       | 'global' flag, all instances within the string |
*/

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""
