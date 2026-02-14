/*
Rot13 ("rotate by 13 places") is a letter-substitution cipher that translates a String into a new String:

For each character in the original String:

- If the character is a letter in the modern English alphabet, change it to the character 13 positions later in the alphabet. Thus, a becomes n. If you reach the end of the alphabet, return to the beginning. Thus, o becomes b.
- Letter transformations preserve case. A becomes N while a becomes n.
- Don't modify characters that are not letters.

PDBAD

=== PROBLEM ===

Given a string, change each letter to the next letter that is 13 positions forward in the alphabet

Rules:
- Only change letters, no other characters
- If 13 positions forward is past 'z', loop back to 'a'
- Maintain case (upper and lower)
- Two rot13 rotations return all letters to the original positions

=== DATA ===

Input: A string with letters, spaces, and punctuation
Intermediate:
- an empty string to build the answer
- a for loop to iterate through the string
Output: A new string where the letters are rotated

=== BRAINSTORM ===

create an empty string as the result
iterate over each char in the string
  if the current char is a letter:
    rotate it 13 positions forward
    add that new letter to the result
  else
    add char to result
return that result

how to rotate?
  use ascii code
  for looping:
    use modulo with an offset
    ((code - 65) % 26) + 65 (uppercase)
    ((code - 97) % 26) + 97 (lowercase)
  add 13 within the looping around code

how to detect letters?
  if uppercase and lowercase produce different results
  char.toUpperCase() !== char.toLowerCase()

=== FEEDBACK ===

- utilise the String.prototype.charCodeAt() method to obtain the codes so that the code is even more intentional 
- For an extra challenge, you may want to try to refactor your code so that the rotation size can be passed in as an argument. What if the rotation size was 100?

=== FEEDBACK 2 ===

- use String.prototype.charCodeAt() for the const constants, rather than hardcode 65 and 97
- allow rot13() to have another parameter that is the rotation

*/

const UPPERCASE_MIN = 'A'.charCodeAt(0); // 65
const LOWERCASE_MIN = 'a'.charCodeAt(0); // 97
const LOWERCASE_MAX = 'z'.charCodeAt(0); // 122
const ALPHABET_RANGE = LOWERCASE_MAX - LOWERCASE_MIN + 1; // 26

function isLetter(char) {
  return char.toUpperCase() !== char.toLowerCase()
}

function rotateLetter(letter, rotation) {
  let asciiCode = letter.charCodeAt(0);
  let offset = asciiCode >= LOWERCASE_MIN ? LOWERCASE_MIN : UPPERCASE_MIN;
  let rotatedAsciiCode = ((asciiCode + rotation - offset) % ALPHABET_RANGE) + offset;
  
  return String.fromCharCode(rotatedAsciiCode);;
}

function rot13(string, rotation) {
  if (rotation === undefined) {
    rotation = 13;
  }
  
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    if (isLetter(string[i])) {
      let newLetter = rotateLetter(string[i], rotation);

      result += newLetter;
    } else {
      result += string[i];
    }
  }

  return result;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// Teachers open the door, but you must enter by yourself.
console.log(rot13('Teachers open the door, but you must enter by yourself.', 100));
// Pawydano klaj pda zkkn, xqp ukq iqop ajpan xu ukqnoahb.
