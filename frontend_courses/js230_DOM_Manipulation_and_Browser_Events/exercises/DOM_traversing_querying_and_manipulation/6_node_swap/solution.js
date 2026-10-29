/*
Write a function that takes two element ids as arguments and swaps the positions of the elements represented by the ids. The function returns true for valid swaps and undefined for invalid. To put the focus on the node swapping functionality, you can assume that nodes will have a value for the id attribute and two arguments will always be provided. 
*/

function invalidSwap(e1, e2) {
  return !e1 || !e2 || e1.contains(e2) || e2.contains(e1);
}

function nodeSwap(id1, id2) {
  let element1 = document.getElementById(id1);
  let element2 = document.getElementById(id2);
  
  if (invalidSwap(element1, element2)) return undefined;
  
  let element1Copy = element1.cloneNode(true);
  let element2Copy = element2.cloneNode(true);

  element1.parentElement.replaceChild(element2Copy, element1);
  element2.parentElement.replaceChild(element1Copy, element2);

  return true;
}

// at least one of the id attributes doesn't exist
nodeSwap(1, 20); // > undefined

// at least one of the nodes is a "child" of the other
nodeSwap(1, 4); // > undefined
nodeSwap(9, 3); // > undefined

// one swap
nodeSwap(1, 2); // > true