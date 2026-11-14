async function postData() {
  let data = { title: 'Eloquent JavaScript', author: 'Marijn Haverbeke' };
  let json = JSON.stringify(data);

  let response = await fetch('https://lsjs230-book-catalog.herokuapp.com/books', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: json,
  });

  if (response.status === 201) {
    console.log(`This book was added to the catalog: ${await response.text()}`);
  }
}

postData(); // This book was added to the catalog: {"title":"Eloquent JavaScript","author":"Marijn Haverbeke"}

// Write out the raw text of the HTTP request that will be sent to the server by the last example above.

// POST /books HTTP/1.1
// Host: lsjs230-book-catalog.herokuapp.com
// Content Type: application/json; charset=utf-8
// Accept: */*
// 
// {title: "Eloquent JavaScript", author: "Marijn Haverbeke"}
