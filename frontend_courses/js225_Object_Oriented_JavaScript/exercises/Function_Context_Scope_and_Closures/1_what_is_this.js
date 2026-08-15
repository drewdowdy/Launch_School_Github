// Read the following code carefully. What do you think is logged on line 7. Try to answer the question before you run the code.

const person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName);

/*
Answer:

> NaN

Outside of a function, `this` refers to the global scope object. And since there are no such firstName and lastName properites on it in this program, they are undefined and undefined. And when added together, return NaN.
*/
