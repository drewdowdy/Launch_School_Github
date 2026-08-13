/*
We'll build a simple todo list program using the techniques we've seen in this assignment. Write a makeList function that returns a new function that implements a todo list. The returned function should have the following behavior:

- When called with an argument that is not already on the list, it adds that argument to the list.
- When called with an argument that is already on the list, it removes the element from the list.
- When called without arguments, it logs all items on the list. If the list is empty, it logs an appropriate message.
*/

function makeList() {
  let list = [];

  return function(item) {
    let idx = list.indexOf(item)

    if (item === undefined) {
      for (let todo of list) {
        console.log(todo);
      }
    } else if (idx > -1) {
      let idx = list.indexOf(item);
      list.splice(idx, 1);
      console.log(`${item} removed!`);
    } else {
      list.push(item);
      console.log(`${item} added!`);
    }
  }
}

let list = makeList();
list();
// > The list is empty.
list('make breakfast');
// > make breakfast added!
list('read book');
// > read book added!
list();
// > make breakfast
// > read book
list('make breakfast');
// > make breakfast removed!
list();
// > read book
