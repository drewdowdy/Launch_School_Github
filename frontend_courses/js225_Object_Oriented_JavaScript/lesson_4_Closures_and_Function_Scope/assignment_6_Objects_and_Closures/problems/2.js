// Update the implementation from problem 1 so that it retains the use of an object with methods but prevents outside access to the items the object stores internally.

function makeList() {
  items = [];
  
  return {
    
    add(newItem) {
      let idx = items.indexOf(newItem);

      if (idx < 0) {
        items.push(newItem);
        console.log(newItem + ' added!');
      }
    },

    remove(item) {
      let idx = items.indexOf(item);

      if (idx >= 0) {
        items.splice(idx, 1);
        console.log(item + ' removed!');
      }
    },

    list() {
      if (items.length === 0) console.log('This list is empty.');

      for (let item of items) {
        console.log(item);
      }
    },
  }
}

let list = makeList();
list.add('peas');
// peas added!
list.list();
// peas
list.add('corn');
// corn added!
list.list();
// peas
// corn
list.remove('peas');
// peas removed!
list.list();
// corn

console.log(list.items); 
// undefined
