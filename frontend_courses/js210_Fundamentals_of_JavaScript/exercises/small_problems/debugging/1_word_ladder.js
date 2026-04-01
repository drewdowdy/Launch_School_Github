/*
Gemma and some friends are working on a complex program to generate word ladders, transforming one word into another word one character at a time. The smallest of her tasks is to print the resulting ladder to the screen.

A "ladder" is simply an array of word strings; Gemma decides to transform this array into a single string where each word within the string is separated by a hyphen ('-'). For example, the array ['pig', 'pie', 'lie', 'lit', 'let'] should be printed as the string 'pig-pie-lie-lit-let'.

Upon first glance, Gemma's code below looks like it should work. But it throws a TypeError, saying: Cannot read property 'forEach' of undefined. Why is that?
*/

let ladder = ''

['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(word => {
  if (ladder !== '') {
    ladder += '-'
  }

  ladder += word
})

console.log(ladder)  // expect: head-heal-teal-tell-tall-tail
// TypeError: Cannot read properties of undefined (reading 'forEach') at Object.<anonymous>


// Since there is no explicit semi-colon on the first line, JS interprets it as the following:

// let ladder = ''['head', ...].forEach()

// Instead of an array, JS is trying to see if the empty string has a property with the value of the array, which returns undefined. And we cannot call forEach() on undefined.
