// Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

function staggeredCase(string) {
  let result = '';
  let lastChangeWasUpper = false;
  
  for (let i = 0; i < string.length; i += 1) {
    let currentChar = string[i];

    if (/[a-z]/i.test(currentChar)) {
      if (lastChangeWasUpper) {
        result += currentChar.toLowerCase();

        lastChangeWasUpper = false;
      } else {
        result += currentChar.toUpperCase();

        lastChangeWasUpper = true;
      }
    } else {
      result += currentChar
    }
  }

  console.log(result);
  return result;
}

staggeredCase('I Love Launch School!');        // "I lOvE lAuNcH sChOoL!"
staggeredCase('ALL CAPS');                     // "AlL cApS"
staggeredCase('ignore 77 the 444 numbers');    // "IgNoRe 77 ThE 444 nUmBeRs"
