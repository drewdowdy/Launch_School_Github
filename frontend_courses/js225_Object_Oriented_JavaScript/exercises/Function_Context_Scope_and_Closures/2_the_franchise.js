/*
The method franchise.allMovies is supposed to return the following array:

[
  'How to Train Your Dragon 1',
  'How to Train Your Dragon 2',
  'How to Train Your Dragon 3'
]

Explain why this method will not return the desired object. Try fixing this problem by taking advantage of JavaScript lexical scoping rules.
*/

const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    let self = this;
    return [1, 2, 3].map(function(number) {
      return `${self.name} ${number}`;
    });
  },
};

console.log(franchise.allMovies());

// Answer:
// Inside an anonymous function, this refers to the global object. We can fix this by creating a new variable called self that references this outside of the map invocation and we can then use self in the anonymous function used by the map invocation
