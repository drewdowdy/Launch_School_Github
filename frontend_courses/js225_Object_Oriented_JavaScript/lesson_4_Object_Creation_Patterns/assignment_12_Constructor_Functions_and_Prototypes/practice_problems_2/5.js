// Similar to the problem above, without using Object.create, create a begetObject method that you can call on any object to create an object inherited from it:

// Hint: What prototype object do we have to add a method to so that "any" object will be able to look it up?

Object.prototype.begetObject = function() {
  function Temp() {};
  Temp.prototype = this; // the calling object
  return new Temp();
}

let foo = {
  a: 1,
};

let bar = foo.begetObject();
console.log(foo.isPrototypeOf(bar)); // true
