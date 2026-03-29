// Write a function that takes a word string as an argument and returns true if the word can be spelled using the set of blocks, false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

/*
PDBAD

=== PROBLEM ===

Write a function that determines if a given word is able to be spelled with blocks

Rules:

- Each block has 2 letters

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

- function is case insensitive


=== DATA ===

input: string of letters

intermediate:
- constant of block values

output: boolean true if word is able to be spelled with blocks, false otherwise

=== BRAINSTORM ===

store the blocks as key-value pairs
each letter of the alphabet has a matching pair
when a block is used you must:
  - get the value of the first key
  - remove the first key and the key that is the value
  - ie. remove BLOCKS['A'] and BLOCKS[BLOCKS['A']]

iterate over the letters of the word
  for each letter, remove each 'block' (2 letters)
  return true if all letters can remove a block
  otherwise return false

=== ALGORITHM ===

make the blocks:
- initialize a string of letters 'A' to 'Z'
- initialize a string of the corresponding letters
- initialize an empty object to hold the result
- for loop (iterate from index 0 up the length of the alphabet)
  - set the index of the alphabet letter to the index of the corresponding letter in the result
- return that result object

check if a word can be spelled:
- initilize a variable to hold the 'blocks' object
- change the input to uppercase to accound for case insensitivity
- iterate over each letter of the word
  - if the word and corresponding word exist in the blocks
    - remove them
  - else
    - return false
- return true if iteration does not short circuit

*/

function makeBlocks() {
  let side1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  let side2 = 'NOPQRSTUVWXYZABCDEFGHIJKLM';
  
  let blocks = {} 

  for (let i = 0; i < side1.length; i += 1) {
    blocks[side1[i]] = side2[i];
  }
  
  return blocks;
}

function isBlockWord(word) {
  let uppercaseWord = word.toUpperCase();
  let blocks = makeBlocks();

  for (let char of uppercaseWord) {
    if (blocks[char] && blocks[blocks[char]]) {
      delete blocks[blocks[char]];
      delete blocks[char];
    } else {
      console.log('false');
      return false;
    }
  }

  console.log('true');
  return true;
}

isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
