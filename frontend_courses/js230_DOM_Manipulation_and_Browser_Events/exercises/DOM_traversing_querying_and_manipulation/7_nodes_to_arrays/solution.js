/*
Implement a function that converts the DOM, starting from the body, to nested arrays. Each element in the DOM is represented as ["PARENT_TAG_NAME", [children]] where children are elements as well and as such follow the same format. When an element has no children, it's represented as ["PARENT_TAG_NAME", []]. For instance, if the HTML doesn't have any elements inside the body, the result array would be: ["BODY", []]. Likewise, if the HTML only has a div element as its content, the result array would be: ["BODY", [["DIV", []]]].
*/

function nodesToArr(element=document.body) {
  return [
    element.tagName,
    Array.from(element.children).map(nodesToArr),
  ]
}

// Example 1
nodesToArr();
/*
= ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]]

// OR

= ["BODY", [
    ["HEADER", []],
    ["MAIN", []],
    ["FOOTER", []]]]
*/

// Example 2
nodesToArr();
/*
> nodesToArr();
= ["BODY",[["HEADER",[]],["MAIN",[["DIV",[]],["DIV",[]]]],["FOOTER",[]]]]

// OR

= ["BODY", [
    ["HEADER", []],
    ["MAIN", [
      ["DIV", []],
      ["DIV", []]]],
    ["FOOTER",[]]]]
*/

nodesToArr();
/*
= ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]]

// OR

= ["BODY", [
  ["DIV", [
    ["DIV", []],
    ["DIV", [
      ["DIV",[]]]]]],
      ["DIV", []],
      ["DIV", [
        ["DIV", []],
        ["DIV", []],
        ["DIV", []]]]]]
*/
        