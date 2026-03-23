function rotate90(matrix) {
  let rows = matrix.length;
  let cols = matrix[0].length;

  let result = [];

  for (let col = 0; col < cols; col += 1) {
    let newRow = [];
    
    for (let row = 0; row < rows; row += 1) {
      newRow.push(matrix[row][col]);
    }

    result.push(newRow.reverse());
  }

  return result;
}

const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]