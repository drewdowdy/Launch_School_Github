/*
Implement a function, sliceTree, that is "similar" to the Array.prototype.slice method, but this time for a DOM tree. The sliceTree function takes two arguments: the start index which is the parent node's id attribute and, the end index which is the innermost child node's id attribute. The function returns an array of tagNames. Take note of the following when implementing the sliceTree function:

- It's similar to slice but different in the sense that slice isn't inclusive on the right hand side.
- The end index doesn't have to be the id of the "innermost" child node as some of the examples suggest.
- Only consider element nodes.
- Only elements that have body as an ancestor (parent, grandparent, etc.) are sliceable.
- If the id attribute of the start or end index is not in the DOM, return undefined.
- If the slice is not feasible — there's no path connecting the element at the starting index to the ending index — return undefined.
*/

function sliceTree(startId, endId) {
  let startElement = document.getElementById(startId);
  let endElemement = document.getElementById(endId);

  if (!startElement || !endElemement) return undefined;

  let sliceTree = [];
  let currentElement = endElemement;

  while (currentElement.tagName !== 'BODY') {
    sliceTree.unshift(currentElement.tagName);
    currentElement = currentElement.parentElement;
  }
  
  return sliceTree;
}

sliceTree(1, 4);
// ["ARTICLE", "HEADER", "SPAN", "A"]
sliceTree(1, 76);
// undefined
sliceTree(2, 5);
// undefined
sliceTree(5, 4);
// undefined
sliceTree(1, 23);
// ["ARTICLE", "FOOTER"]
sliceTree(1, 22);
// ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
sliceTree(11, 19);
// ["SECTION", "P", "SPAN", "STRONG", "A"]