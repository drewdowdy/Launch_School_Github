// Write a Function named totalArea that takes an Array of rectangles as an argument. The Function should return the total area covered by all the rectangles.

/*

Tasks:
- get area of each rectangle (map)
- add all the areas together (reduce)

*/

function area(sides) {
  return sides[0] * sides[1];
}

function sum(total, num) {
  return total + num;
}

function totalArea(rectangles) {
  let allAreas = rectangles.map(area);
  return allAreas.reduce(sum);
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

totalArea(rectangles);    // 141

// Now, write a second Function named totalSquareArea. This Function should calculate the total area of a set of rectangles, just like totalArea. However, it should only include squares in its calculations: it should ignore rectangles that aren't square.

/*

Task:
- only select the squares from the list of rectangles (filter)

*/

function isSquare(sides) {
  return sides[0] === sides[1];
}

function totalSquareArea(rectangles) {
  let squares = rectangles.filter(isSquare);
  return totalArea(squares);
}

totalSquareArea(rectangles);    // 121
