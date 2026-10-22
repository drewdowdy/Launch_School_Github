// 1. Write a JavaScript function that returns the p elements in the DOM represented by the HTML

function getAllParagraphs() {
  let paragraphs = [];
  let nodes = document.body.childNodes;

  for (let i = 0; i < nodes.length; i++) {
    let currentNode = nodes[i];

    if (currentNode instanceof HTMLParagraphElement) {
      paragraphs.push(currentNode);
    }
  }

  return paragraphs;
}

// 2. Write a JavaScript function that adds the class article-text to every <p> tag in the HTML

function addClasstoParagraphs(className) {
  let paragraphs = getAllParagraphs();

  for (let i = 0; i < paragraphs.length; i++) {
    let currentParagraph = paragraphs[i];
    currentParagraph.classList.add(className);
  }
}

addClasstoParagraphs('article-text');

// 3. Rewrite number 2 to perform the same action but in two steps: find each element by a tag name, then add a class name to the class

function getElementsByTagName(tagName) {
  let matches = [];
  let nodes = document.body.childNodes;

  for (let i = 0; i < nodes.length; i++) {
    let currentNode = nodes[i];
    if (currentNode.nodeName.toLowerCase() === tagName) {
      matches.push(currentNode);
    }
  }

  return matches;
}

function addClassNameToElements(elements, className) {
  for (let i = 0; i < elements.length; i++) {
    let currentElement = elements[i];
    currentElement.classList.add(className);
  }
}

let paragraphs = getElementsByTagName('p');
addClassNameToElements(paragraphs, 'article-text');

// 4. Update the answer to question 3 of problem group 1 to use the document.getElementsByTagName method:

let paragraphs2 = document.getElementsByTagName('p');

// 5. Update the code from Problem 1 to add the article-text class to paragraphs inside <div class="intro">, and nowhere else.

let intros = document.getElementsByClassName('intro');

for (let i = 0; i < intros.length; i++) {
  let paragraphs = intros.getElementsByTagName('p');

  paragraphs.forEach(p => {
    p.classList.add('atricle-text');
  });
}

// 6.



