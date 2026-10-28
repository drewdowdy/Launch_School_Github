// Write a JavaScript function that takes an element's id and returns the DOM tree of the element in a two-dimensional array. The first subarray contains the element and its siblings, the second contains the parent of the element and its siblings, so on and so forth, all the way up to the "grandest" parent. Assume that the grandest parent is the element with an id of "1".

function walkUp(element, callback) {
  callback(element);

  if (element.parentElement.tagName === 'BODY') {
    return;
  } else if (element.parentElement) {
    walkUp(element.parentElement, callback);
  }
}

function domTreeTracer(id) {
  let result = [];
  let element = document.getElementById(id);
  if (!element) return;

  walkUp(element, (currentEle) => {
    let currentGenElements = Array.from(currentEle.parentElement.children)
    let currentGenNames = currentGenElements.map(({ tagName }) => tagName);
    result.push(currentGenNames);
  })

  console.log(result);
}

domTreeTracer(1);
// [["ARTICLE"]]
domTreeTracer(2);
// [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
domTreeTracer(22);
// [["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
