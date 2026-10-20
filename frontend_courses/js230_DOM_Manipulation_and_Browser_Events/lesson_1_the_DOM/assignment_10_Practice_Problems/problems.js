// These commands are written in Chrome Dev Tools


// recursive traversing function
function walk(node, callback) {
  callback(node);

  for (let i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

// 1. Starting with the document node, use the lastChild and childNodes properties to change the text color to red on the On the River heading and set its font size to 48 pixels.

let html = document.childNodes[1];
let body = html.lastChild;
let heading = body.childNodes[1];

body.style.color = 'red';
header.style.fontSize = '48px';

// 2. Count the paragraphs on the page and then log the result.

let count = 0;

walk(document, (node) => {
  if (node.nodeName === 'P') {
    count++;
  }
})

console.log(count);

// 3. Retrieve the first word from each paragraph on the page and log the entire list.

let firstWords = [];

walk(document, (node) => {
  if (node.nodeName === 'P') {
    let text = node.firstChild.data.trim()
    let firstWord = text.split(' ')[0];
    firstWords.push(firstWord);
  }
})

console.log(firstWords);

// 4. Add the class stanza to each paragraph except the first.

let first = true;

walk(document, (node) => {
  if (node.nodeName === 'P') {
    if (first) {
      first = false;
    } else {
      node.classList.add('stanza');
    }
  }
})
