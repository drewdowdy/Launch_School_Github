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

  store.addEventListener('submit', async event => {
    event.preventDefault();

    let form = event.target;
    let data = new FormData(form);
    let url = `https://ls-230-web-store-demo.herokuapp.com${form.getAttribute('action')}`;

    let response = await fetch(url, {
      method: 'POST',
      body: data,
      headers: {
        Authorization: 'token AUTH_TOKEN',
      }
    });

    store.innerHTML = await response.text();
  })
});

