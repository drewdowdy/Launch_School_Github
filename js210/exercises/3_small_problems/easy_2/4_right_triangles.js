/*
Write a function that takes a positive integer, n, as an argument and logs a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.
*/

function triangle(number) {
  let stars = '*';
  let spaceNum = number - 1;
  let lines = [];

  for (; spaceNum >= 0; spaceNum -= 1) {
    lines.push(' '.repeat(spaceNum) + stars);
    stars += '*'
  }

  lines.forEach((line) => 
    console.log(line)
  );
}

triangle(5);
/*
    *
   **
  ***
 ****
*****
*/

triangle(9);
/*
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
*/