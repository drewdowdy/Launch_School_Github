// Create a function that can create an object with a given object as its prototype, without using Object.create.

function createObject(obj) {
  function Temp() {};   // create temporary constructor
  Temp.prototype = obj; // set prototype to obj
  return new Temp();    // return new instance of constructor
}

// alternative
function createObject(obj) {
  return Object.setPrototypeOf({}, obj);
}

let foo = {
  a: 1
};

let bar = createObject(foo);
console.log(foo.isPrototypeOf(bar)); // true
