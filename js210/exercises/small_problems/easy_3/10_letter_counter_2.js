// Modify the wordSizes function from the previous exercise to exclude non-letters when determining word size. For instance, the word size of "it's" is 3, not 4.

function cleanString(string) {
  return string.replace(/[^\w\s]/g, ''); // targets anything NOT a word character or a whitespace
}

function wordSizes(string) {
  let result = {};
  let words = cleanString(string).split(' ');

  for (let i = 0; i < words.length; i += 1) {
    let currentWord = words[i];

    if (currentWord.length === 0) {
      continue;
    }

    if (Object.keys(result).includes(currentWord.length)) {
      result[currentWord.length] += 1;
    } else {
      result[currentWord.length] = 1;
    }
  }

  console.log(result);
  return result;
}

wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 2 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 3 }
wordSizes("What's up doc?");                              // { "5": 1, "2": 1, "3": 1 }
wordSizes('');                                            // {}
