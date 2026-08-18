// Using the code from the previous exercise, move the greeting from the constructor method to an instance method named greet that logs a greeting to the console when invoked. Additionally, define one more instance method named rename that renames a Cat instance when invoked.

class Cat {
  constructor(name='Kitty') {
    this.name = name;
  }
  
  greet() {
    console.log("I'm a cat!");
  }

  rename(newName) {
    this.name = newName;
  }
}

let cat = new Cat('Sprinkles');
let kitty = new Cat();

cat.greet();   // I'm a cat!
kitty.greet(); // I'm a cat!

cat.rename('Socks');
kitty.rename('Fred');

console.log(cat.name);   // Socks
console.log(kitty.name); // Fred
