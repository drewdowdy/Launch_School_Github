/*
In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal. Positions on the board equate to coordinate numbers. Given a set up like so:
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _

The white queen's position equates to (2, 3) and the black queen is at (5, 6). In this example the queens are on the same diagonal, and therefore can attack each other.

Write a function which, given a string representation of the board with the two queens, returns true or false depending on whether the queens can attack each other or not.
*/

/*
PDBAD

=== PROBLEM ===

Write a function that returns true if two queens on a chess board can attack each other and false otherwise

Rules:
- 'W' is the white queen
- 'B' is the black queen
- no other pieces will appear on the board
- queens can attack vertically, horizontally and diagonally
- positions on the board are zero-indexed coordinates
  - 'W' --> (2, 3)
  - 'B' --> (5, 6)
- the top left corner is (0, 0) on the board
- an underscore `_` is an empty space on the board
- the board is 8x8
  - the board string contains underscores, new line (\n), a `W` and a `B`.

=== DATA ===

input: a long string representation of a chess board with two queen pieces on it
intermediate:
  - the board as an array (better for coordinate system)
output: the boolean true if the two queens can attack, false otherwise

=== BRAINSTORM ===

1. Get the coordinates of both queens
  - Break the board into an array of strings
    - each string is a row of the board
    - a row is ALWAYS 8 spaces long and there are 8 rows
    - use match? -> split after 8 occurances of any character
  - find each queen
    - iterate through the parsed board
      - if 'W' is found, note its coordinates
      - if 'B' is found, note it's coordinates
      - if both are found, stop iteration (short circuit)
2. Determine if they are attackable
  - Are they horizontally attackable?
    - the queen coordinates have the same row value
  - Are they vertically attackable?
    - the queen coordinates have the same col value
  - Are they diagonally attackable?
    - the absolute value of the row and col values are the same
3. Return the boolean result
  - compare the coordinate results directly
    - abstract them to helper functions for readability

=== ALGORITHM ===

- Parse the board
  - split the string on the new line char \n
- locate the queens
  - iterate over the indices of the board array for rows (for (let row = 0))
    - iterate over the indices of the string for cols (for (let col = 0))
      - if board[row][col] has a queen
        - return [row, col] as an array
  - (repeat for both queens)
- determine if the queens are...
  - horizontal
    - if the row values are the same for both queens (queen1[0] === queen2[0])
      - return true
    - else false
  - vertical
    - if the col values are the same for both queens (queen1[1] === queen2[1])
      - return true
    - else false
  - diagonal
    - the the absolute value of the difference between the row and col value of the queens are the same (Math.abs())
      - return true
    - else false
- if no queens are located on the board, return undefined

=== DEBUG ===

- one of my test cases won't work
  - incorrectly created test

*/

// helper functions
function findQueen(board, color) {
  for (let row = 0; row < board.length; row += 1) {
    for (let col = 0; col < board[row].length; col += 1) {
      if (board[row][col] === color) return [row, col];
    }
  }
}

function parseBoard(boardString) {
  return boardString.split('\n');
}

function areDiagonal(queen1, queen2) {
  return Math.abs(queen1[0] - queen1[1]) ===
         Math.abs(queen2[0] - queen2[1]);
}

function areVertical(queen1, queen2) {
  return queen1[1] === queen2[1];
}

function areHorizontal(queen1, queen2) {
  return queen1[0] === queen2[0];
}

// solution function
function queensAttackable(board) {
  board = parseBoard(board);
  let [ white, black ] = [findQueen(board, 'W'), findQueen(board, 'B')];

  if (white === undefined || black === undefined) return undefined;

  return areHorizontal(white, black) ||
         areVertical(white, black) ||
         areDiagonal(white, black);
}

// attackable diagonally
console.log(queensAttackable('________\n' +
                             '________\n' +
                             '___W____\n' +
                             '________\n' +
                             '________\n' +
                             '______B_\n' +
                             '________\n' +
                             '________\n') === true);

console.log(queensAttackable('B_______\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '_______W\n') === true);

// attackable horizontally
console.log(queensAttackable('________\n' +
                             '________\n' +
                             '__B___W_\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n') === true);

console.log(queensAttackable('________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '___BW___\n' +
                             '________\n' +
                             '________\n') === true);

// attackable vertiacally
console.log(queensAttackable('________\n' +
                             '________\n' +
                             '___W____\n' +
                             '________\n' +
                             '________\n' +
                             '___B____\n' +
                             '________\n' +
                             '________\n') === true);

console.log(queensAttackable('________\n' +
                             '________\n' +
                             '_______B\n' +
                             '_______W\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n') === true);

// non-attackable
console.log(queensAttackable('________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '___W____\n' +
                             '________\n' +
                             '____B___\n' +
                             '________\n') === false);

console.log(queensAttackable('W_______\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '_B______\n') === false);

// blank board
console.log(queensAttackable('________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n' +
                             '________\n') === undefined);
