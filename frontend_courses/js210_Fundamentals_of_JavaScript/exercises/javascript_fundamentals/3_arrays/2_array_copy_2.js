/*
In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied, but not the reference. Implement two alternative ways of doing this.

Here is the code from the previous exercise:
*/

// use Array.prototype.slice()
let myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice(); // creates a new array with same values

myArray.pop();
console.log(myOtherArray); // [1, 2, 3, 4]

myArray = [1, 2];
console.log(myOtherArray); // [1, 2, 3, 4]

// Manually create a new array with same values
let myArray2 = [1, 2, 3, 4];
const myOtherArray2 = []; // initialize to empty array

for (let i = 0; i < myArray2.length; i++) {
  myOtherArray2.push(myArray2[i]); // add each value to new array
}

myArray2.pop();
console.log(myOtherArray2); // [1, 2, 3, 4]

myArray2 = [1, 2];
console.log(myOtherArray2); // [1, 2, 3, 4]
