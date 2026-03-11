// Write a function that takes a string argument consisting of a first name, a space, and a last name, and returns a new string consisting of the last name, a comma, a space, and the first name.

function swapName(fullName) {
  let names = fullName.split(' ');
  let lastIndex = names.length - 1;

  return names[lastIndex] + ', ' + names.slice(0, -1).join(' ');
 }

swapName('Joe Roberts');    // "Roberts, Joe"
swapName('Darwin Raglan Caspian Ahab Poseidon Nicodemus Watterson') // "Watterson, Darwin Raglan Caspian Ahab Poseidon Nicodemus"
