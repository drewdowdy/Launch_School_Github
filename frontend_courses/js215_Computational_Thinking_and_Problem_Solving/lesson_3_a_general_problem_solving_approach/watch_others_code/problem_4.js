/*
You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

"1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
"1-3, 1-2" --> 1, 2, 3, 11, 12
"1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
"104-2" --> 104, 105, ... 112
"104-02" --> 104, 105, ... 202
"545, 64:11" --> 545, 564, 565, .. 611

PDBAD

=== PROBLEM ===

Write a function that returns an array of numbers that are included in the range provided

Rules:
- ranges are written in shorthand
  - a range is two numbers with a seperator in the middle
  - with no seperator, it's just that number
- the ranges are always increasing
  - so when a number is less than, the previous, its interpreted as higher
    - 3, 4 --> 3, 14
    - 10, 9 --> 10, 19
    - 50, 9 --> 50, 59
    - 104, 102 --> 104, 1102
    - 104, 2 --> 104, 112
    - 104, 02 --> 104, 202
- the next highest number is next possible numer that ends with the written part

=== DATA ===

input: a string of digits with seperators
intermediate:
  - an array to build
  - strings of digits to parse
output: an array of numbers that are the complete set of all numbers from the input ranges

=== BRAINSTORM ===

1. break the string into a list of ranges and numbers
2. iterate over the items
  - if its a range (with a seperator)
    - break it into the list of Numbers from start to end
  - if its not a range (its a number part only)
    - compare with the previous number in the list
    - determine the next largest number that ends with that number part
3. return the new list of transformed numbers

- how to determine the next largest number?
  - previousNum, numPart (both as strings)
  - add the significant part of previousNum to the start of numPart
  - if numPart is now greater than previousNum
    - return numPart
  - else
    - increment the significant part by 1 and compare again

- how to keep track of the previous number?
  - make a variable mostRecentNum
  - anytime changes are made to the result, change its value to the last number in the range or the next largest number that was calculated

- how to deal with a multiple range item?
- treat it like two ranges
  - 1:5:2
    - 1:5 --> 1, 2, 3, 4, 5
    - 5:2 --> 5:12 --> 5, 6, 7, ... 12
    - combine the two ranges from the shared number
    - 1, 2, 3, 4, 5, 6, 7, ... 12

=== ALGORTITHM ===

1. break the string into a list of ranges and numbers
  - rangeStr.split(',')
2. iterate over the items (forEach)
- if its a range (with a seperator) (indexOf)
  - item.match(/\d/); --> extract the digits
    - break it into the list of Numbers from start to end
    - 
  - if its not a range (its a number part only)
    - compare with the previous number in the list
    - determine the next largest number that ends with that number part
3. return the new list of transformed numbers

*/

function p(...items) {
  for (item of items) {
    console.log(item);
  }
}

function isRange(sequence) {
  return sequence.indexOf(':') !== -1
    || sequence.indexOf('-') !== -1
    || sequence.indexOf('..') !== -1;
}

function nextLargestNumberStr(previousNumStr, numPartStr) {
  let previousNumInt = parseInt(previousNumStr, 10);
  let hasLeadingZero = numPartStr.startsWith('0');
  let minLength = hasLeadingZero ? numPartStr.length + 1 : numPartStr.length;

  let result;

  if (previousNumStr.length < minLength) {
    result = '1' + numPartStr;
  } else {
    let prefixIdx = previousNumStr.length - numPartStr.length;
    let prefix = previousNumStr.slice(0, prefixIdx);

    result = (prefix || '0') + numPartStr;

    if (parseInt(result, 10) <= previousNumInt) {
      let newPrefix = String(parseInt((prefix || '0'), 10) + 1);
      
      result = newPrefix + numPartStr;
    }
  }

  return result;
}

// p(
//   nextLargestNumberStr('2', '1') === '11',
//   nextLargestNumberStr('3', '2') === '12',
//   nextLargestNumberStr('10', '9') === '19',
//   nextLargestNumberStr('104', '2') === '112',
//   nextLargestNumberStr('104', '02') === '202',
// );

function expandRange(numArr) {
  let result = [];
  
  for (let i = 0; i < numArr.length - 1; i++) {
    let currentNumStr = numArr[i];
    let nextNumStr = numArr[i + 1];
    let currentInt = parseInt(currentNumStr, 10);

    let rangeStart = currentInt;
    let rangeEnd = parseInt(nextLargestNumberStr(currentNumStr, nextNumStr), 10);

    for (let n = ((i === 0 ? rangeStart : rangeStart + 1)); n <= rangeEnd; n++) {
      result.push(n);
    }
  }

  return result;
}

// p(
//   expandRange(['1', '5']), // [1, 2, 3, 4, 5]
//   expandRange(['1', '5', '2']), // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
// );

function parseCompleteRange(rangeStr) {
  let sequences = rangeStr.split(', ');
  let mostRecentNum = sequences[0];
  let completeRange = [];

  for (let i = 0; i < sequences.length; i++) {
    let currentSequence = sequences[i];

    if (isRange(currentSequence)) {
      let numArr = currentSequence.split(/[:-]|\.\./g);

      if (parseInt(numArr[0], 10) < parseInt(mostRecentNum, 10)) {
        numArr[0] = nextLargestNumberStr(mostRecentNum, numArr[0]);
      }

      let expanded = expandRange(numArr);
      completeRange = [...completeRange, ...expanded];
      mostRecentNum = String(expanded[expanded.length - 1]);
    } else {
      let nextNum = i === 0 ?
        parseInt(currentSequence, 10) :  
        parseInt(nextLargestNumberStr(mostRecentNum, currentSequence), 10);

      completeRange.push(nextNum);
      mostRecentNum = String(nextNum);
    }
  }

  return completeRange;
}

p(
  parseCompleteRange("1, 3, 7, 2, 4, 1"), // 1, 3, 7, 12, 14, 21
  parseCompleteRange("1-3, 1-2"), // 1, 2, 3, 11, 12
  parseCompleteRange("1:5:2"), // 1, 2, 3, 4, 5, 6, ... 12
  parseCompleteRange("104-2"), // 104, 105, ... 112
  parseCompleteRange("104-02"), // 104, 105, ... 202
  parseCompleteRange("545, 64:11"), // 545, 564, 565, .. 611
);


