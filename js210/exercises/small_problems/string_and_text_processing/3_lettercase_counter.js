// Write a function that takes a string and returns an object containing three properties: one representing the number of characters in the string that are lowercase letters, one representing the number of characters that are uppercase letters, and one representing the number of characters that are neither.

function letterCaseCount(string) {
  let count = {
    lowercase: 0,
    uppercase: 0,
    neither: 0,
  }

  for (let i = 0; i < string.length; i += 1) {
    let currentChar = string[i];

    if (/[a-z]/.test(currentChar)) {
      count.lowercase += 1;
    } else if (/[A-Z]/.test(currentChar)) {
      count.uppercase += 1;
    } else {
      count.neither += 1;
    }
  }

  console.log(count);
  return count;
}

letterCaseCount('abCdef 123');  // { lowercase: 5, uppercase: 1, neither: 4 }
letterCaseCount('AbCd +Ef');    // { lowercase: 3, uppercase: 3, neither: 2 }
letterCaseCount('123');         // { lowercase: 0, uppercase: 0, neither: 3 }
letterCaseCount('');            // { lowercase: 0, uppercase: 0, neither: 0 }
