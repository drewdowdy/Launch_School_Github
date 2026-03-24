/*
A triangle is classified as follows:

- Right: One angle is a right angle (exactly 90 degrees).
- Acute: All three angles are less than 90 degrees.
- Obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the three angles of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

You may assume that all angles have integer values, so you do not have to worry about floating point errors. You may also assume that the arguments are in degrees.
*/

function isValidTriangle(angle1, angle2, angle3) {
  return [angle1, angle2, angle3].reduce((accum, n) => accum + n) === 180
         && angle1 > 0
         && angle2 > 0
         && angle3 > 0;
}

function triangle(angle1, angle2, angle3) {
  if (!isValidTriangle(angle1, angle2, angle3)) {
    console.log('invalid');
    return 'invalid';
  }

  if (angle1 === 90 || angle2 === 90 || angle3 === 90) {
    console.log('right');
    return 'right';
  } else if (angle1 < 90 && angle2 < 90 && angle3 < 90) {
    console.log('acute');
    return 'acute';
  } else if (angle1 > 90 || angle2 > 90 || angle3 > 90) {
    console.log('obtuse');
    return 'obtuse';
  }
}

triangle(60, 70, 50);       // "acute"
triangle(30, 90, 60);       // "right"
triangle(120, 50, 10);      // "obtuse"
triangle(0, 90, 90);        // "invalid"
triangle(50, 50, 50);       // "invalid"
