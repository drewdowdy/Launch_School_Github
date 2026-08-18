// Without calling the Cat constructor, create an object that looks and acts like a Cat instance that doesn't have a defined name.

class Cat {
  constructor(name) {
    this.name = name;
  }
  speaks() {
    return `${this.name} says meowwww.`;
  }
}

let fakeCat = Object.create(Cat.prototype);
// creates an empty object that inherits the same prototype as Cat

console.log(fakeCat instanceof Cat); // logs true
console.log(fakeCat.hasOwnProperty('name')); // logs false
console.log(fakeCat.speaks()); // logs undefined says meowwww.
