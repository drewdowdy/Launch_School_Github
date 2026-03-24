// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

const myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

const prop2 = '456';
myObject['prop2'] = '456'; // reassigns value of prop2
myObject[prop2] = '678';   // inserts new key, value: '456': 678

console.log(myObject[prop2]); // > 678
console.log(myObject.prop2);  // > 456

