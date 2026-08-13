// Use the partial function shown above and your solution to problem 1 to create sayHello and sayHi functions that work like this:

function greet(phrase, person) {
  phrase = phrase[0].toUpperCase() + phrase.slice(1);
  console.log(`${phrase}, ${person}!`);
}

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  }
}

let sayHello = partial(greet, 'hello');
let sayHi = partial(greet, 'hi');

sayHello('Brandon');
// Hello, Brandon!
sayHi('Sarah');
// Hi, Sarah!
