// Using the code from the previous question, write any code necessary so that the string Hello! I'm a cat! is logged to the console when Cat.genericGreeting is invoked.

class Cat {
  constructor(name='Kitty') {
    this.name = name;
  }
  
  greet() {
    console.log(`Hello! My name is ${this.name}`);
  }

  rename(newName) {
    this.name = newName;
  }

  static genericGreeting() {
    console.log('Hello! I am a cat.')
  }
}

let cat = new Cat('Sprinkles');

cat.greet();
Cat.genericGreeting();
