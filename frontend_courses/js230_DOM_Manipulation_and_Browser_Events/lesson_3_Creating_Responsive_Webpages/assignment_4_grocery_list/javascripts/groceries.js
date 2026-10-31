(function() {
  class GroceryList {
    constructor(selector) {
      this.list = document.querySelector(selector);
    }

    addItem(name, quantity) {
      let newItem = document.createElement('li');
      
      newItem.append(`${quantity} ${name}`);
      this.list.append(newItem);
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    let form = document.body.querySelector('form');
    let groceryList = new GroceryList('#grocery-list');

    form.addEventListener('submit', (event) => {
      event.preventDefault();

      let name = document.body.querySelector('#name').value;
      let quantity = document.body.querySelector('#quantity').value || '1';

      groceryList.addItem(name, quantity);
      form.reset();
    })
  })
})();
