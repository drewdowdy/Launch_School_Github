// Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string. Duplicate substrings should be included multiple times.

// You may (and should) use the substrings function you wrote in the previous exercise.

// For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not. In addition, assume that single characters are not palindromes.

function leadingSubstrings(string) {
  let result = [];
  let stringArr = string.split('');

  for (let i = 0; i < string.length; i += 1) {
    let substring = stringArr.slice(0, i + 1).join('');
    result.push(substring);
  }

  return result;
}

function substrings(string) {
  let result = [];

  for (let i = 0; i < string.length; i += 1) {
    let currentSlice = string.split('').slice(i).join('');
    result = result.concat(leadingSubstrings(currentSlice));
  }

  return result;
}

function isPalindrome(string) {
  if (string.length === 1) return false;
  return string.split('').reverse().join('') === string;
}

function palindromes(string) {
  let allSubstrings = substrings(string);
  let allPalindromes = allSubstrings.filter(substring => isPalindrome(substring))
  
  console.log(allPalindromes);
  return allPalindromes;
}

palindromes('abcd');       // []
palindromes('madam');      // [ "madam", "ada" ]

palindromes('hello-madam-did-madam-goodbye');
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  // "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  // "-madam-", "madam", "ada", "oo" ]
palindromes('knitting cassettes');
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
