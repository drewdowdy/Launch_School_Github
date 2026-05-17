/*
Write a function that returns the position of the closest active opponent. If two opponents are equidistant, return the opponent with the higher position on the board.

PDBAD 

=== PROBLEM ===

Given an object of opponent names and their positions, return the position of the opponent that is closest to a given position

Rules:
- "closest" position --> number that is closest
- positions in object could be null
  - ignore non-number values
- if two positions are equidistant from the input, return the higher position
- positions are always positive integers

=== DATA ===

input:
  - an object of oponent names and positions
  - a number that is a position to check
intermediate:
  - an array of positions
output: a number that is one of the oponent positions that is closest to the input position

=== BRAINSTORM ===

// using two arrays
1. get a list of all of the positions
2. get a new list that is all of the distances from the input position
3. determine the index of the smallest distance
4. use that index to retrieve the smallest distance from list

// using reduce
1. get a list of all of the positons
2. reduce the list to the smallest distance from the input

How to use reduce to get the position w/ smallest distance?
  - iterate over the positions oppPositions.reduce((smallest, current) => {})
    - if the distance of the current one is smaller than `smallest`
      - `smallest` becomes `current`
    - else
      - no change to `smallest`

=== ALGORITHM ===

1. get a list of all of the positons
  - get all the values of the positions input
  - Object.values(positions)
2. reduce the list to the smallest distance from the input
  - iterate over the positions oppPositions.reduce((smallest, current) => {})
    - if the distance of the current one is smaller than `smallest`
      - `smallest` becomes `current`
    - else
      - no change to `smallest`

=== DEBUG ===

Need to account for equidistant values
  - if it's equidistant
    - smallest is the greater value

Need to return null if no positions are provided
  - check if there are any keys in the given positions object
*/

function distanceBetween(pos1, pos2) {
  return Math.abs(pos1 - pos2);
}

function findClosestOpponent(positions, position) {
  if (Object.keys(positions).length === 0) return null;

  let allPositions = Object.values(positions);
  let activePositions = allPositions.filter(p => p !== null);

  return activePositions.reduce((smallest, current) => {
    let smallestDistance = distanceBetween(smallest, position);
    let currentDistance = distanceBetween(current, position);

    if (smallestDistance > currentDistance) {
      smallest = current;
    } else if (smallestDistance === currentDistance) {
      let biggerValue = smallest > current ? smallest : current;
      smallest = biggerValue;
    }

    return smallest;
  }, 0);
}

console.log(findClosestOpponent({
  "Opponent 1" : 1,
  "Opponent 2" : 15,
  "Opponent 3" : 37
}, 10)); // 15

console.log(findClosestOpponent({ // equidistant
  "Opponent 1a" : 1,
  "Opponent 1b" : 5
}, 3)); // 5

console.log(findClosestOpponent({ // has null value
  "Opponent 1a" : 1, "Opponent 1b" : 5,
  "Opponent 1c" : 50, "Opponent 1d" : 100, "Opponent 1e" : null
}, 150)); // 100

// empty positions input
console.log(findClosestOpponent({}, 74)); // null

// differing opponent names
console.log(findClosestOpponent({
  "Atlas" : 1,
  "Luna" : 15,
  "" : 37
}, 10)); // 15

// several null opponents
console.log(findClosestOpponent({
  "Opponent 1a" : null, "Opponent 1b" : 5, "Opponent 1c" : null,
  "Opponent 1d" : null, "Opponent 1e" : 200, "Opponent 1f" : 400
}, 300)); // 400
