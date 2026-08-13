// Write a function named greet that takes two arguments and logs a greeting:

function greet(phrase, person) {
  phrase = phrase[0].toUpperCase() + phrase.slice(1);
  console.log(`${phrase}, ${person}!`);
}

greet('howdy', 'Joe');
// Howdy, Joe!
greet('good morning', 'Sue');
// Good morning, Sue!
