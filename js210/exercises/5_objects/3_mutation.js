// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
const array2 = [];

for (let i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

for (let i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);

/*
Initial Idea: The values of array2 will all be lowercase. When `String.prototype.toUpperCase()` is called on array1[i], it returns a new string and is not mutating the original string.

Takeaways:
- Primitives (Strings, Numbers, Booleans) are pass by value
- Objects and Arrays are pass by reference
- Here, `array2.push(array1[i])` adds a copy of the string value at array1[i] to array2
- Changing values in array1 does not affet array2 since their values are seperate
- IF array1 held Objects and Arrays that were pushed to array2, then changing the values of those objects would affect the objects in array2
*/
