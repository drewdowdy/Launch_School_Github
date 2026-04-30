// Write a Function named anagram that takes two arguments: a word and an array of words. Your function should return an array that contains all the words from the array argument that are anagrams of the word argument. For example, given the word "listen" and an array of candidate words like "enlist", "google", "inlets", and "banana", the program should return an array that contains "enlist" and "inlets".

/*
Tasks:
- select only words that are anagrams (filter)
- sort letters alphabetically and compare to word (sort)
*/

const sortWord = (word) => word.toLowerCase().split('').sort().join('');
const isAnagramOf = (word, wordtoCheck) => sortWord(word) === sortWord(wordtoCheck);

function anagram(word, list) {
  return list.filter(currentWord => isAnagramOf(word, currentWord));
}

console.log(
  anagram('listen', ['enlists', 'google', 'inlets', 'banana']),  // [ "inlets" ]
  anagram('listen', ['enlist', 'google', 'inlets', 'banana'])   // [ "enlist", "inlets" ]
);
