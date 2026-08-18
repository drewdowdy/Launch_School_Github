// Rewrite the two following object types to use the class keyword, instead of direct prototype manipulation. Person exposes a method greeting, which when called returns a greeting text. Shouter is a subtype of Person, and is a bit loud, so whatever he says is uppercased.

class Person {
  constructor(name) {
    this.name = name;
  }

  greeting() {
    return `Hello, I'm ${this.name}. It's very nice to meet you.`;
  }
}

class Shouter extends Person {
  constructor(name) {
    super(name);
  }

  greeting() {
    return super.greeting().toUpperCase();
  }
}

// function Person(name) {
//   this.name = name;
// }

// Person.prototype.greeting = function() {
//   return `Hello, I'm ${this.name}. It's very nice to meet you.`;
// }

// function Shouter(name) {
//   Person.call(this, name);
// }

// Shouter.prototype = Object.create(Person.prototype);
// Shouter.prototype.greeting = function() {
//   return Person.prototype.greeting.call(this).toUpperCase();
// }

let person = new Person("Jane");
let shouter = new Shouter("Bob");

console.log(person.greeting()); // Hello, I'm Jane. It's very nice to meet you.
console.log(shouter.greeting()); // HELLO, I'M BOB. IT'S VERY NICE TO MEET YOU.
