// Create a function neww, so that it works like the new operator. For this practice problem, you may use Object.create.

function neww(constructor, args) {
  // empty obj w/ prototype of the constructor's prototype
  let obj = Object.create(constructor.prototype); 
  
  // pass in the empty obj as the context for the invocation of the constructor function w/ arguments (changes obj)
  let result = constructor.apply(obj, args); 

  // if constructor has an explicit returned object, return it; otherwise, return the updated obj;
  return typeof result === 'object' ? result : obj; 
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

let john = neww(Person, ['John', 'Doe']);
john.greeting();          // => Hello, John Doe
john.constructor;         // Person(firstName, lastName) {...}
