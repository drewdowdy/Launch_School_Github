// We have been asked to implement a function that determines whether or not a given word is a reserved keyword. We wrote the isReserved function below along with some test cases, but we aren't seeing the expected result. Why not? Fix the code so that it behaves as intended.

const RESERVED_KEYWORDS = ['break', 'case', 'catch', 'class', 'const', 'continue',
  'debugger', 'default', 'delete', 'do', 'else', 'enum', 'export', 'extends', 'finally',
  'for', 'function', 'if', 'implements', 'import', 'in', 'instanceof', 'interface',
  'let', 'new', 'package', 'private', 'protected', 'public', 'return', 'static',
  'super', 'switch', 'this', 'throw', 'try', 'typeof', 'var', 'void', 'while',
  'with', 'yield'];

function isReserved(name) {
  RESERVED_KEYWORDS.forEach(reserved => {
    if (name === reserved) {
      return true;
    }
  });

  return false;
}

console.log(isReserved('monkey')); // false
console.log(isReserved('patch'));  // false
console.log(isReserved('switch')); // should be: true

// My first idea is that the intended short circuiting is not occuring so all inputs will return false.
// Since we are using forEach() to iterate over RESERVED_KEYWORDS, it will iterate once per item, regardless of return values.
// In order to fix this, we have to iterate in such a way that short circuiting is possible. Here is a solution:

function isReserved(name) {
  for (let i = 0; i < RESERVED_KEYWORDS.length; i++) { // change to for loop
    if (name === RESERVED_KEYWORDS[i]) { // access values with property accessor
      return true;
    }
  };

  return false;
}

// We can also make it even more consise:

function isReserved(name) {
  return RESERVED_KEYWORDS.includes(name);
}
