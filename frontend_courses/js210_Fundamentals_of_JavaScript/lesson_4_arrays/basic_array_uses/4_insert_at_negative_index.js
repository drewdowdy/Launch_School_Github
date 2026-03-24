/*
Q: Can we insert data into an array at a negative index? If so, why is this possible?

Reaction: My first instinct is no, JavaScript will not allow you to insert at negative indices.

Answer: Yes. Arrays are Objects in JavaScript so the -1 acts as a different 'index'
*/
let digits = [4, 8, 15, 16, 23, 42];

digits[-1] = -42;
console.log(digits[-1]);
console.log(digits['-1']);    // Note that we are using a string here
console.log(digits);
console.log(digits.length);