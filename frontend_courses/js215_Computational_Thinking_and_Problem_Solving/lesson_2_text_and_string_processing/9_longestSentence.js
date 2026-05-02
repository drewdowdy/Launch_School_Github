/*
PDBAD

=== PROBLEM ===

Write a function that logs the longest sentence from a text and the number of words in that longest sentence.

Rules:
- sentence: begin with any word character and end with `.`, `!`, or `?` (but ending punctuation is part of the sentence)
- word: any character that's NOT (` `, `.`, `!`, or `?`) and delimited by one or more spaces

=== DATA ===

input: a very long string of sentences
intermediate:
  - regex
  - array of sentences
  - array of words
output:
  - a string that is the longest sentence
  - a number that is the number of words in a sentence

=== BRAINSTORM ===

1. split the text into sentences
2. determine the longest sentence

use a regex to split the sentences apart
also with the words from a sentence

*/

// one or more characters that are not `.`, `!`, or `?`
const WORD_REGEX = '[^ .!?]+';

// one or more instances of a word followed by 0 or more spaces ending with `.`, `!`, or `?`
const SENTENCE_REGEX = `(${WORD_REGEX}\\s*)+[.!?]`

function makeParser(pattern) {
  let regex = new RegExp(pattern, 'g');
  return (text) => text.match(regex);
}

const parseWords = makeParser(WORD_REGEX);
const parseSentences = makeParser(SENTENCE_REGEX);

function longest(long, current) {
  return long.length < current.length ? current : long
}

function longestSentence(text) {
  let sentences = parseSentences(text);

  let maxSentence = sentences.reduce(longest);
  let maxWords = parseWords(maxSentence);

  console.log(maxSentence);
  console.log('');
  console.log(`The longest sentence has ${maxWords.length} words.`);
}

let longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';

longestSentence(longText);
// It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.

// The longest sentence has 86 words.


// Assuming the last sentence is removed:
let anotherLongText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced.';

longestSentence(anotherLongText);
// Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.

// The longest sentence has 30 words.