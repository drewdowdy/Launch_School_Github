// A triangle is classified as follows:

// - Equilateral: All three sides are of equal length.
// - Isosceles: Two sides are of equal length, while the third is different.
// - Scalene: All three sides are of different lengths.

// To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and every side must have a length greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

// Write a function that takes the lengths of the three sides of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'equilateral', 'isosceles', 'scalene', or 'invalid'.

function isValidTriangle(side1, side2, side3) {
  let [shortest, middle, longest] = [side1, side2, side3].sort((x, y) => x - y);
  return shortest > 0 && shortest + middle > longest;
}

function isEquilateral(...sides) {
  return sides[0] === sides[1] 
         && sides[0] === sides[2]
         && sides[1] == sides[2];
}

function isIsoceles(...sides) {
  return sides[0] === sides[1]
         || sides[0] === sides[2]
         || sides[1] === sides[2];
}

function triangle(side1, side2, side3) {
  if (!isValidTriangle(side1, side2, side3)) {
    console.log('invalid');
    return 'invalid';
  }

  if (isEquilateral(side1, side2, side3)) {
    console.log('equilateral');
    return 'equilateral';
  } else if (isIsoceles(side1, side2, side3)) {
    console.log('isoceles');
    return 'isoceles';
  } else {
    console.log('scalene');
    return 'scalene';
  }
}

triangle(3, 3, 3);        // "equilateral"
triangle(3, 3, 1.5);      // "isosceles"
triangle(3, 4, 5);        // "scalene"
triangle(0, 3, 3);        // "invalid"
triangle(3, 1, 1);        // "invalid"
