function createProduct(id, name, stock, price) {
  return {
    id,
    name,
    stock,
    price,

    setPrice(newPrice) {
      if (newPrice < 0) console.log('Invalid price. Cannot be less than $0.');
      this.price = newPrice;
    },

    describeTool() {
      console.log('ID:', this.id);
      console.log('Name:', this.name);
      console.log('Stock:', this.stock);
      console.log('Price:', this.price);
    },
  }
}

let scissors = createProduct(0, 'Scissors', 8, 10);
let drill = createProduct(0, 'Cordless Drill', 15, 45);

scissors.setPrice(-11);
scissors.setPrice(11);

scissors.describeTool();
