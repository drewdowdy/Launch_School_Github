/*
Mini Inventory Management System
In this exercise, you'll build a simple inventory management system composed of three components:

1. Item Creator – validates and constructs item objects.
2. Item Manager – manages the collection of items (create, update, delete, query).
3. Report Manager – generates reports for individual items or for all items.

Component Specifications

Item Creator:

The item creator is responsible for validating data and constructing new items.

Each item must have the following properties:

1. SKU Code — A unique identifier generated from the item name and category.
  - It consists of the first 3 letters of the item name and the first 2 letters of the category.
  - If the item name has two words and the first word has only two letters, the next letter is taken from the second word.
  - All letters in the SKU code are uppercase.
2. Item Name — Must contain at least 5 non-space characters.
3. Category — Must be a single word with at least 5 characters.
4. Quantity — Must be provided (you may assume a valid number is supplied).
5. If any of these validations fail, the item creator returns an object with a single property:
  - { notValid: true }

If all validations pass, it returns a plain object with the four properties listed above (skuCode, itemName, category, quantity). Item objects should not include any additional properties or methods.

Item Manager:

The item manager is responsible for maintaining and manipulating the collection of items. It exposes the following:

1. items — A property containing a list (array) of all item objects.
2. create(itemName, category, quantity) — Uses the item creator to validate and create a new item.
  - If creation succeeds, the new item is added to the collection.
  - If creation fails, this method returns false.
3. update(skuCode, itemInfo) — Updates any information on an existing item (assume valid values).
4. delete(skuCode) — Removes the item with the given SKU code from the list (assume valid SKU).
5. inStock() — Returns a list of all items with a quantity greater than 0.
6. itemsInCategory(category) — Returns a list of all items belonging to the given category.

Report Manager:

The report manager is responsible for generating reports about items. It exposes the following methods:

1. init(itemManager) — Accepts the ItemManager object and stores it for later use.
2. createReporter(skuCode) — Returns a reporter object for the given SKU code.
  - The returned object has one method, itemInfo(), which logs each property of the item as "key: value" (one per line).
  - The reporter object should not have any other properties or methods (other than those from Object.prototype).
3. reportInStock() — Logs a comma-separated list of item names that are currently in stock.

Notes:

- You don’t need to enforce unique SKU codes; duplicates are allowed under this spec.
- Each required piece of information for an item corresponds to one property.
- If invalid information is provided, the item creator returns { notValid: true }, and the item manager’s create method returns false.
- You may add helper methods to ItemManager as needed.

*/

function ItemCreator(itemName, category, quantity) { // constructor function
  function isInvalidItemInputs(itemName, category, quantity) {
    return isInvalidName(itemName)
      || isInvalidCategory(category)
      || isInvalidQuantity(quantity);
  }

  function isInvalidName(itemName) {
    return typeof itemName !== 'string'
          || (itemName.match(/\S/g) || []).length < 5; // at least 5 non space chars
  }

  function isInvalidCategory(category) {
    return typeof category !== 'string'
          || category.length < 5
          || /\s/.test(category); 
  }

  function isInvalidQuantity(quantity) {
    return typeof quantity !== 'number'
          || quantity < 0
          || !Number.isInteger(quantity);
  }

  function generateSkuCode(itemName, category) {
    let front = itemName.replace(/\s/g, '').slice(0, 3).toUpperCase();
    let back = category.slice(0, 2).toUpperCase();
    
    return front + back;
  }
  
  if (isInvalidItemInputs(itemName, category, quantity)) {
    return { notValid: true };
  }

  this.skuCode = generateSkuCode(itemName, category);
  this.itemName = itemName;
  this.category = category;
  this.quantity = quantity;
}

// let validItem = new ItemCreator('basket ball', 'sports', 0);
// let invalidItem = new ItemCreator('asd', 'sports', 0); 

// console.log(validItem);
// console.log(invalidItem);

const ItemManager = (() => {
  function getItem(items, skuCode) { // "private" aka in the scope of returned obj due to IIFE
    return items.find(item => item.skuCode === skuCode);
  }

  return {
    items: [],

    create(itemName, category, quantity) {
      let item = new ItemCreator(itemName, category, quantity);
      if (item.notValid) return false;
      this.items.push(item);
    },

    update(skuCode, itemInfo) {
      Object.assign(getItem(this.items, skuCode), itemInfo); // mutates 1st arg, overwrites existings props
    },

    delete(skuCode) {
      let itemIdx = this.items.findIndex(item => item.skuCode === skuCode);
      this.items.splice(itemIdx, 1);
    },

    inStock() {
      return this.items.filter(item => item.quantity > 0);
    },
    
    itemsInCategory(category) {
      return this.items.filter(item => item.category === category);
    }
  }
})();

const ReportManager = {
  init(itemManager) {
    this.itemManager = itemManager;
  },

  createReporter(skuCode) {
    let item = this.itemManager.items.find(item => item.skuCode === skuCode);

    return {
      itemInfo() {
        for (let prop of Object.keys(item)) {
          console.log(`${prop}: ${item[prop]}`);
        }
      }
    }
  },

  reportInStock() {
    let itemNames = this.itemManager.inStock().map(item => item.itemName);
    console.log(itemNames.join(', '));
  },
};
  
ItemManager.create('basket ball', 'sports', 0);       // valid
ItemManager.create('asd', 'sports', 0);               // invalid (too short)
ItemManager.create('soccer ball', 'sports', 5);       // valid
ItemManager.create('football', 'sports');             // invalid (no quantity)
ItemManager.create('football', 'sports', 3);          // valid
ItemManager.create('kitchen pot', 'cooking items', 0);// invalid (category has space)
ItemManager.create('kitchen pot', 'cooking', 3);      // valid

console.log(ItemManager.items);
// => list with 4 valid items

ReportManager.init(ItemManager);
ReportManager.reportInStock();
// logs: soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
ItemManager.inStock();
// => football, kitchen pot

ReportManager.reportInStock();
// logs: football,kitchen pot

ItemManager.itemsInCategory('sports');
// => basket ball, soccer ball, football

ItemManager.delete('SOCSP');
ItemManager.items;
// => remaining 3 valid items (soccer ball removed)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs:
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs:
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10
