// Read through the code shown below. What does it log to the console at lines 7, 8, 11, and 12?

let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop();
console.log(myArray); // [1, 2, 3]
console.log(myOtherArray); // [1, 2, 3]

myArray = [1, 2]; // new array
console.log(myArray); // [1, 2]
console.log(myOtherArray); // [1, 2, 3]

/*
=== line 7, line 8 ===
Both variables reference the same array object

myArray ──────────┐
                  ├──> [1, 2, 3, 4]
myOtherArray ─────┘

=== line 11, line 12 ===
`myArray` is reassigned to a new array while `myOtherArray` still references the original

myArray ───────> [1, 2]    (new array)
                
myOtherArray ──> [1, 2, 3] (original value)
*/
