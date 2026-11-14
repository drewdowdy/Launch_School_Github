document.addEventListener('DOMContentLoaded', async () => {
  let store = document.getElementById('store');
  let response = await fetch('https://ls-230-web-store-demo.herokuapp.com/products');
  store.innerHTML = await response.text();

  store.addEventListener('click', async event => {
    let target = event.target;
    if (target.tagName !== "A") {
      return;
    }

    event.preventDefault();
    let url = 'https://ls-230-web-store-demo.herokuapp.com' + target.getAttribute('href');
    let response = await fetch(url);
    store.innerHTML = await response.text();
  });
});

// Can't edit any products because the POST requests are sent to file:///products/:id
