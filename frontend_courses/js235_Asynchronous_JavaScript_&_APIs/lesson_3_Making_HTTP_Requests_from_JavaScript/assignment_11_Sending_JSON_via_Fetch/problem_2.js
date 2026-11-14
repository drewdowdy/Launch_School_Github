/*
Write some JavaScript to create a new product by sending a request to the JSON API on our web store. To create a product, make a POST request to https://ls-230-web-store-demo.herokuapp.com/v1/products. To make the post request, you'll need the following:

- Content-Type header set to 'application/json; charset=utf-8'
- Authorization header set to 'token AUTH_TOKEN'
- json object with the following properties:
  - name
  - sku (must have 3 or more characters)
  - price (must be an integer greater than 0)
*/

async function createProduct(productInfo) {
  let json = JSON.stringify(productInfo);
  
  let response = await fetch('https://ls-230-web-store-demo.herokuapp.com/v1/products', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=uft-8',
      'Authorization': 'token AUTH_TOKEN',
    },
    body: json,
  });

  let data = await response.json();
  console.log(`This object was added to the store: ${JSON.stringify(data)}`);
}

createProduct({
  name: 'Apple Pen',
  sku: 'APPP123',
  price: 270,
});
