// Given a string of words separated by spaces, write a function that swaps the first and last letters of every word.

// You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces, and that there are no leading, trailing, or repeated spaces.

function swap(string) {
  let words = string.split(' ');
  let newWords = [];

  for (let i = 0; i < words.length; i += 1) {
    let currentWord = words[i];

    if (currentWord.length === 1) {
      newWords.push(currentWord);
      continue;
    }

    let firstLetter = currentWord[0]
    let lastLetter = currentWord[currentWord.length - 1];
    let middle = currentWord.slice(1, currentWord.length - 1);

    newWords.push(lastLetter + middle + firstLetter);
  }

  return newWords.join(' ');
}

// using Array.prototype.map()
function swap(string) {
  let words = string.split(' ');

  let newWords = words.map(currentWord => {
    let firstLetter = currentWord[0]
    let lastLetter = currentWord[currentWord.length - 1];
    let middle = currentWord.slice(1, currentWord.length - 1);

    let swappedWord = currentWord.length === 1 ? currentWord : lastLetter + middle + firstLetter

    return swappedWord;
  });

  console.log(newWords.join(' '));
  return newWords.join(' ');
}

swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"
