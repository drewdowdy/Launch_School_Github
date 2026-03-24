// Write a function that takes a string consisting of one or more space separated words and returns an object that shows the number of words of different sizes.

// Words consist of any sequence of non-space characters.

function wordSizes(string) {
  let result = {};
  let words = string.split(' ');

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

wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");                              // { "2": 1, "4": 1, "6": 1 }
wordSizes('');                                            // {}
