/*
Implement a function that converts a nested array of nodeNames (see Nodes to Array exercise for examples) to nodes
*/

function arrayToNodes(arr) {
  let [ parentName, children ] = arr;
  let parent = document.createElement(parentName);

  if (children.length === 0) return parent;

  children.forEach(child => parent.appendChild(arrayToNodes(child)));

  return parent;
}

// Nested array of nodes
const nodes = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];
// OR
//
// ["BODY", [
//   ["HEADER", []],
//   ["MAIN", []],
//   ["FOOTER", []]]]

console.log(arrayToNodes(nodes));

// Nested array of nodes
const nodes2 = ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]];

// OR
//
// ["BODY", [
//   ["DIV", [
//     ["DIV", []],
//     ["DIV", [
//       ["DIV",[]]]]]],
//   ["DIV", []],
//   ["DIV", [
//     ["DIV", []],
//     ["DIV", []],
//     ["DIV", []]]]]]

console.log(arrayToNodes(nodes2));