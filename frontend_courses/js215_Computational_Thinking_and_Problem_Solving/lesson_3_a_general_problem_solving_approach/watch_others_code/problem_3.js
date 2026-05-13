/*
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

Examples:

isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true

PDBAD

=== PROBLEM ===

Write a function that can determine if a given word can be spelled using blocks

Rules:
- blocks have pairs of letters on them
- if a block is used to spell a letter, the other letter on the block cannot be used
- input words are case insensitive
- input words cannot use double letters
  - only one block per letter

=== DATA ===

input: a string that is a word
intermediate:
  - an object to hold the blocks?
output: boolean true if the input can be composed of the blocks, false otherwise

=== BRAINSTORM ===

how to make the blocks?
- an object
  - each key can be a letter and the value can be the other side of the block
  - remove a block by removing the letter that is the key AND the letter that is the value of that key

1. return false if the input is not valid
2. iterate over each letter of the input word
  - if the letter exists as a block
    - remove the block
  - else
    - return false
3. return true if iteration completes

=== ALGORITHM ===

1. return false if the input is not valid
  - check if the input is only composed of alphabet chars (regex /[a-z]+/gi) regex.test(input)
2. iterate over each letter of the input word (for loop)
  - if the letter exists as a block
    - remove the block
  - else
    - return false
3. return true if iteration completes

remove a block:
- get the value of the currentLetter
- delete operator for currentLetter
- delete operator for value of currentLetter

=== DEBUG ===

I am not accounting for case
  - clean the string first by downcasing it

Since I am mutating blocksObj, i can't invoke calls after because the blocks are altered after each removeBlock invocation
  - make a function to create blocks

*/

function p(...items) {
  // console.log(items);
  for (let item of items) {
    console.log(item);
  }
}

// first attempt
function makeBlocks() {
  return {
    a: 'n', b: 'o', c: 'p', d: 'q', e: 'r', f: 's', g: 't', h: 'u', i: 'v', j: 'w',
    k: 'x', l: 'y', m: 'z', n: 'a', o: 'b', p: 'c', q: 'd', r: 'e', s: 'f', t: 'g',
    u: 'h', v: 'i', w: 'j', x: 'k', y: 'l', z: 'm', 
  };
}

function removeBlock(letter, blocks) {
  let otherSide = blocks[letter];
  delete blocks[letter];
  delete blocks[otherSide];
}

function isBlockWord(word) {
  if (!/[a-z]+/gi.test(word)
    || word === undefined 
    || word === '') return false;

  let blocksObj = makeBlocks();
  word = word.toLowerCase();

  for (let letter of word) {
    if (blocksObj[letter]) {
      removeBlock(letter, blocksObj);
    } else {
      return false;
    }
  }

  return true;
}

// alternate with an array of strings
const BLOCKS = [
  'BO', 'XK', 'DQ', 'CP', 'NA',
  'GT', 'RE', 'FS', 'JW', 'HU',
  'VI', 'LY', 'ZM',
];

function isBlockWord(word) {
  if (!/[a-z]+/gi.test(word)
    || word === undefined 
    || word === '') return false;

  word = word.toUpperCase();
  let usedLetters = [];

  for (letter of word) {
    if (usedLetters.includes(letter)) {
      return false;
    } else {
      for (block of BLOCKS) {
        if (block.indexOf(letter) !== -1) {
          usedLetters.push(block[0], block[1]);
          break;
        }
      }
    }
  }

  return true;
}

p(
  // valid
  isBlockWord('BATCH') === true, // uppercase
  isBlockWord('jest') === true, // lowercase
  // invalid
  isBlockWord('!@#$#') === false, // non-alphabet chars
  isBlockWord('') === false, // empty string
  isBlockWord() === false, // no input
  isBlockWord('hello') === false, // double letters
);