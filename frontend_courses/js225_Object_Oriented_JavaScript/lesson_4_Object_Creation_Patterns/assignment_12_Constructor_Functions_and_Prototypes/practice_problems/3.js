// Write a constructor function Circle, that takes a radius as an argument. You should be able to call an area method on the created objects to get the circle's area. Test your implementation with the following code:

// prototype inheritance
let Circle = function(r) {
  this.radius = r;
}

Circle.prototype.area = function() { // all Circle objects share the same method from the prototype (efficient)
  return Math.PI * (this.radius ** 2);
}

// alternate: constructor
function Circle(r) {
  this.radius = r;

  this.area = function() { // each Circle object has its own copy of the method (inefficient)
    return Math.PI * (this.radius ** 2);
  }
}

let a = new Circle(3);
let b = new Circle(4);

console.log(a.area().toFixed(2)); // => 28.27
console.log(b.area().toFixed(2)); // => 50.27
