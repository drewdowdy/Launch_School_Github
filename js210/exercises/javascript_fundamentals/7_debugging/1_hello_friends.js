// You have written basic functions to display a random greeting to any number of friends upon each invocation of greet. Upon invoking the greet function, however, the output is not as expected. Figure out why not and fix the code.

function randomGreeting() {
  const words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
               'Greetings', 'Salutations', 'Good to see you'];

  const idx = Math.floor(Math.random() * words.length);

  // words[idx]; // (1) functions can only return items with the return keyword prepended to them
  return words[idx]; // correction
}

function greet(...args) {
  const names = Array.prototype.slice.call(args);

  for (let i = 0; i < names.length; i++) {
    const name = names[i];
    // const greeting = randomGreeting; // (2) without the parentheses, we don't invoke the randomGreeting() function, but get a literal of its method body
    const greeting = randomGreeting(); // correction

    console.log(`${greeting}, ${name}!`); 
  }
}

greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');
