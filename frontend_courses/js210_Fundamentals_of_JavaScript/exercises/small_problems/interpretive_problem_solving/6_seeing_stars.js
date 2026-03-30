// Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

function star(size) {
  let rows = [];
  let middleRow = Array(size).fill('*').join('');

  rows.push(middleRow);

  for (let space = 0; space < Math.floor(size / 2); space++) {
    // space out the rows accordingly
    let newRow = ['*', '*', '*'];
    newRow = newRow.join(' '.repeat(space));

    // add edge spaces
    for (let edgeSpacesNum = middleRow.length - newRow.length;edgeSpacesNum > 0; edgeSpacesNum -= 2) {
      newRow = ' ' + newRow + ' ';
    }

    // append the new row to the front and back of rows
    rows.unshift(newRow);
    rows.push(newRow);
  }

  for (let row of rows) {
    console.log(row);
  }
}

star(5);
/*

* * *
 *** 
*****
 *** 
* * *

*/

star(7);
/*

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

*/


star(9);
/*

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

*/

star(11);
/*

*    *    *
 *   *   * 
  *  *  *  
   * * *   
    ***    
***********
    ***    
   * * *   
  *  *  *  
 *   *   * 
*    *    *

*/