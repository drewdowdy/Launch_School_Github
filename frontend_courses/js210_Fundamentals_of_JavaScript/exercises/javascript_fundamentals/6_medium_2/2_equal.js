// Read through the following code. Currently, it does not log the expected result. Explain why this happens, then refactor the code so that it works as expected.

const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson);    // false -- expected: true

// Even though these two objects have the same values, they are not the same object.
// Strict equality `===` checks if two objects are the same object.
// To fix this, we need to make `person` and `otherPerson` reference the same object.
// We can do that my initailizing `otherPerson` to person


