// Write a function named wordCount that takes a single String as an argument. The function should return an Object that contains the counts of each word that appears in the provided String. In the returned Object, you should use the words as keys, and the counts as values.

function wordCount(string) {
  let count = {};
  let words = string.split(' ');

  for (let i = 0; i < words.length; i++) {
    if (count[words[i]]) {
      count[words[i]] += 1;
    } else {
      count[words[i]] = 1;
    }
  }

  return count;
}

wordCount('box car cat bag box');  // { box: 2, car: 1, cat: 1, bag: 1 }
