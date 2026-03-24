/*
The concat function from the previous exercise could only concatenate a maximum of two arrays. For this exercise, you are going to extend that functionality. Refactor the concat function to allow for the concatenation of two or more arrays or values.

Examples:
*/

function concat(array1, ...otherArguments) { // rest parameter syntax
  let resultArray = array1;

  otherArguments.forEach(currentArgument => {
    if (Array.isArray(currentArgument)) {
      for (let i = 0; i < currentArgument.length; i++) {
        resultArray.push(currentArgument[i]);
      }
    } else {
      resultArray.push(currentArgument);
    }
  });

  console.log(resultArray);
  return resultArray;
}

concat([1, 2, 3], [4, 5, 6], [7, 8, 9]);    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
concat([1, 2], 'a', ['one', 'two']);        // [1, 2, "a", "one", "two"]
concat([1, 2], ['three'], 4);               // [1, 2, "three", 4]
