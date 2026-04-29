// Let's build a program that removes numbers that are not a multiple of either 3 or 5 from an array of integers and returns it.

function multiplesOfThreeOrFive(values) {
  return values.filter(isMultipleOfThreeOrFive);
}

function isMultipleOfThreeOrFive(value) {
  return value % 5 === 0 || value % 3 === 0;
}

console.log(
  multiplesOfThreeOrFive([1, 3, 5, 7, 11, 18, 16, 15])  // [ 3, 5, 18, 15 ]
);
