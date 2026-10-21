// 1. Write a JavaScript function that returns the p elements in the DOM represented by the HTML.

function getAllParagraphs() {
  let paragraphs = [];
  let nodes = document.body.childNodes;

  for (let i = 0; i < nodes.length; i++) {
    let current = nodes[i];
    if (current instanceof HTMLParagraphElement) {
      paragraphs.push(current);
    }
  }

  return paragraphs;
}

let paragraphs = getAllParagraphs();

// 2. Write a JavaScript function that adds the class article-text to every <p> tag in this HTML:

function addClassToAllParagraphs(node, className) {
  if (node instanceof HTMLParagraphElement) {
    node.classList.add(className);
  }

  for (let i = 0; i < node.childNodes.length; i++) {
    addClassToAllParagraphs(node.childNodes[i], className);
  }
}

addClassToAllParagraphs(document.body, 'article-text');

/*
3. The solution to the previous problem does everything in one function. It works, but if we need to perform a similar operation later, we must write most of the same code again. We can do better by rethinking the problem.

You can think of the problem as having two primary operations: find all the p elements and then add a class to each of them. We can structure our code similarly; this makes the code's intent clearer to other developers and increases the reusability of the components.

Using this task breakdown, rewrite the solution to the second problem. The core of your solution should be a function named getElementsByTagName that returns an array of all elements with a given tag name. You should then add the CSS class article-text to each paragraph in the array.
*/

function walk(node, callback) {
  callback(node);

  for (let i = 0; i < node.childNodes.length; i++) {
    walk(callback.childNodes[i]);
  }
}

function getElementByTag(tag) {
  let matches = [];

  walk(document.body, n => {
    if (n.nodeName.toLowerCase() === tag) matches.push(node);
  })

  return matches;
}

getElementByTag('p').forEach(paragraph => {
  paragraph.classList.add('article-text');
})
