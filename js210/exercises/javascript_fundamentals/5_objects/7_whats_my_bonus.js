// The calculateBonus function calculates the bonus for a given salary. It makes use of two arguments for determining the bonus: a salary amount and a boolean switch. If the boolean is true, the bonus should be half of the salary; otherwise the bonus should be 0. Fill in the blanks in the function so that it will work, then explain why it works.

function calculateBonus() {
  return arguments[1] ? arguments[0] / 2 : 0;
}

console.log(calculateBonus(2800, true));               // 1400
console.log(calculateBonus(1000, false));              // 0
console.log(calculateBonus(50000, true));              // 25000

/*
We can use the `arguments` object to access an array-like object (but not an array) that contains any arugments passed into the function. We can access arguments by using indices. 
Although we can use this, the more common approach is to use the rest syntax to make an actual array of arguments.
*/ 
