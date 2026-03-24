//  Use the Math.PI property to create a function that converts radians to degrees.

const toDegrees = (radians) => (radians * 180) / Math.PI;

console.log(toDegrees(1)); // 57.2958
console.log(toDegrees(2)); // 114.592
console.log(toDegrees(3)); // 171.887
console.log(toDegrees(4)); // 229.183
console.log(toDegrees(5)); // 286.479
console.log(toDegrees(6)); // 343.775

const toRadians = (degrees) => (degrees * Math.PI) / 180;

console.log(toRadians(30));  // 0.524
console.log(toRadians(45));  // 0.785
console.log(toRadians(60));  // 1.047
console.log(toRadians(90));  // 1.571
console.log(toRadians(180)); // 3.142
console.log(toRadians(270)); // 4.712
console.log(toRadians(360)); // 6.283
