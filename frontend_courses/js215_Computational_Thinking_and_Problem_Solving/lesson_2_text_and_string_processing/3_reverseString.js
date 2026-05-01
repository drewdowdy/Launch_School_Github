// Implement a function that takes a string as an argument and returns a new string that contains the original string in reverse.

function reverse(string) {
  let reversed = '';
  for (let i = string.length - 1; i >= 0; i--) {
    reversed += string[i];
  }
  console.log(reversed);
  return reversed;
}

reverse('hello');                  // returns "olleh"
reverse('The quick brown fox');    // returns "xof nworb kciuq ehT"
