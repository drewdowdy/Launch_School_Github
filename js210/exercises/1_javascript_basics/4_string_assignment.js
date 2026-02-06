let myName = 'Bob';
const saveName = myName;
myName = 'Alice'; // reassigns myName to 'Alice' while saveName maintains 'Bob'
console.log(myName, saveName); // Bob Alice

// Next Example:

const myName = 'Bob';
const saveName = myName;
myName.toUpperCase(); // returns a new string 'BOB'
console.log(myName, saveName); // Bob Bob

/*
In JS, strings are immutable, so line 10 returns the value of BOB but does not mutate the value references by both myName and saveName.
*/
