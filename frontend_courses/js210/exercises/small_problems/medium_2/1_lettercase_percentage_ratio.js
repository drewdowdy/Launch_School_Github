// Write a function that takes a string and returns an object containing the following three properties:

// - the percentage of characters in the string that are lowercase letters
// - the percentage of characters that are uppercase letters
// - the percentage of characters that are neither

// You may assume that the string will always contain at least one character.

function letterPercentages(string) {
  let total = string.length;
  let lowerCaseCount = 0;
  let upperCaseCount = 0;
  let neitherCount = 0;

  for (char of string) {
    if (char >= 'a' && char <= 'z') {
      lowerCaseCount += 1;
    } else if (char >= 'A' && char <= 'Z') {
      upperCaseCount += 1;
    } else {
      neitherCount += 1
    }
  }

  return {
    lowercase: (lowerCaseCount / total).toFixed(2),
    uppercase: (upperCaseCount / total).toFixed(2),
    neither: (neitherCount / total).toFixed(2),
  };
}

letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }