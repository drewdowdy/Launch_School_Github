function transpose(matrix) {
  let result = [];

  for (let row = 0; row < matrix.length; row += 1) {
    result.push([]); // create empty row

    for (let col = 0; col < matrix[row].length; col += 1) {
      result[row].push(matrix[col][row]); // switch row and col
    }
  }

  return result;
}

const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

const newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]