/*
Feedback:
Longest sentence is based on number of words, not characters:
  check the reduce method
Shortest possible sentence doesn't work
*/

// one or more characters that are not a space, `.`, `!`, or `?`
const WORD_REGEX = '[^ .!?]+';

// one or more instances of a word followed by 0 or more spaces followed by `.`, `!`, or `?`
const SENTENCE_REGEX = `(${WORD_REGEX} *)+[.!?]`

function parse(text, pattern) {
  return text.match(pattern);
}

function makeParser(pattern) { // the parsing helper functions were similar so I used partial function application
  let regex = new RegExp(pattern, 'g');
  return function (text) {
    return parse(text, regex);
  };
}

const parseWords = makeParser(WORD_REGEX);
const parseSentences = makeParser(SENTENCE_REGEX);

function longest(long, current) {
  let [ longWords, currentWords ] = [parseWords(long), parseWords(current)];
  return longWords.length < currentWords.length ? current : long; // check for number of words, not characters
}

function longestSentence(text) {
  let sentences = parseSentences(text);

  let maxSentence = sentences.reduce(longest);
  let maxWords = parseWords(maxSentence);

  console.log(maxSentence);
  console.log('');
  console.log(`The longest sentence has ${maxWords.length} word${maxWords.length === 1 ? '' : 's'}.`); // add 's' if more than 1
}

let original1 = {
  text: 'Four score and seven years ago our fathers brought forth' +
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
  ' earth.',
  expected: 'It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.',
  count: 86,
};

let original2 = {
  text: 'Four score and seven years ago our fathers brought forth' +
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
  ' here have thus far so nobly advanced.',
  expected: 'Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.',
  count: 30,
}

let test1 = {
  text: '!!!I yam what I yam!',
  expected: 'I yam what I yam!',
  count: 5
};

let test2 = {
  text: 'To be or not to be? The brown fox is superlative!',
  expected: 'To be or not to be?',
  count: 6,
}

let test3 = {
  text: 'The brown fox is superlative! To be or not to be?',
  expected: 'To be or not to be?',
  count: 6,
}

let test4 = {
  text: 'I!',
  expected: 'I!',
  count: 1,
}

let tests = [original1, original2, test1, test2, test3, test4];

for (test of tests) {
  longestSentence(test.text);
  console.log('===');
  console.log(`Expected: ${test.expected}`);
  console.log(`Count: ${test.count}`);
  console.log('===');
}
