// What will the following code log out and why?

let ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype = { // breaks connection to original prototype
  swingSword: function() {
    return this.swung;
  },
};

console.log(ninja.swingSword());

/*
Answer:

> TypeError: swingSword is not a function

When ninja was created, it inherited the prototype without swingSword. But, the prototype is reassigned to a new and unrelated object while ninja still has a reference to the original prototype. So, the swingSword() function is not on the prototype chain lookup for ninja.
*/
