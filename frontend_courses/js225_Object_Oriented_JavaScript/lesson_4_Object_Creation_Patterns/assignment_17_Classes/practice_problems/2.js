// Using the code from the previous exercise, add a parameter to constructor that provides a name for the Cat object, and assign this parameter to a property called name. If no argument is provided, the name should default to Kitty. Then, replace the I'm a cat! message with a greeting that includes the provided name.

class Cat {
  constructor(name='Kitty') {
    this.name = name;
    console.log("I'm a cat!");
  }
}

let cat = new Cat('Sprinkles');
let kitty = new Cat();

console.log(cat.name);   // Sprinkles
console.log(kitty.name); // Kitty
