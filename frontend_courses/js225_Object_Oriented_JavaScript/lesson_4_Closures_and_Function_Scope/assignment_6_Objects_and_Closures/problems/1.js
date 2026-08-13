// Reimplement makeList, so that it returns an Object that provides the interface shown above, including add, list, and remove methods.

function makeList() {
  
  return {
    items: [],

    add(newItem) {
      let idx = this.items.indexOf(newItem);

      if (idx < 0) {
        this.items.push(newItem);
        console.log(newItem + ' added!');
      }
    },

    remove(item) {
      let idx = this.items.indexOf(item);

      if (idx >= 0) {
        this.items.splice(idx, 1);
        console.log(item + ' removed!');
      }
    },

    list() {
      if (this.items.length === 0) console.log('This list is empty.');

      for (let item of this.items) {
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
