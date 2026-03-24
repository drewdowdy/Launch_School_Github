// Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

/*
PDBAD

=== PROBLEM ===

Write a function that takes an integer that is the width of a diamond and log a diamond of that width to the console

Rules:
- Use * for diamond
- Input will always be an odd integer
- 

=== DATA ===

Input: integer that is the maximum width of the diamond

Intermediate:
- 2D array where each subarray is each row of the diamond

Output: the console logs a diamond that is the correct size and shape

=== BRAINSTORM ===

let result be an empty array
create the middle row
take away 2 *'s from the row; replace with ' ' for spacing
add it to the beginning and end of result

*/

function diamond(size) {
  let result = [];
  let middleRow = Array(size).fill('*');
  
  result.push(middleRow);
  
  for (let spaceNum = 1; spaceNum <= Math.floor(size / 2); spaceNum += 1) {
    let newRow = middleRow.slice();
    
    for (let i = 0; i < spaceNum; i += 1) {
      newRow[i] = ' ';
      newRow[(newRow.length - 1) - i] = ' ';
    }

    result.push(newRow);
    result.unshift(newRow);
  }

  for (let row of result) {
    console.log(row.join(''));
  }
}

diamond(1);
// *

diamond(3);
//  *
// ***
//  *

diamond(5);
//   *
//  ***
// *****
//  ***
//   *

diamond(9);
    // *
  //  ***
  // *****
//  *******
// *********
//  *******
  // *****
  //  ***
    // *

diamond(21);