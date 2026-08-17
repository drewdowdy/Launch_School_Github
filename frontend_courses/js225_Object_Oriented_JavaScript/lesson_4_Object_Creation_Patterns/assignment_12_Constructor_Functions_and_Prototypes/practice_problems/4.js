// What will the following code log out and why?

let ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype.swingSword = function() {
  return this.swung;
};

console.log(ninja.swingSword());

/*
Answer:

> true

Even though the swingSword() function was defined on the prototype after ninja was created, the function is still accessible along the prototype chain lookup.
*/
