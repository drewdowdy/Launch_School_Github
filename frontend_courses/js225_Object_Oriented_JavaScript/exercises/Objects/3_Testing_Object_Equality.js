/*
In JavaScript, comparing two objects either with == or === checks for object identity. In other words, the comparison evaluates as true if it's the same object on either side of == or ===. This is a limitation, in a sense, because sometimes we need to check if two objects have the same key/value pairs. JavaScript doesn't give us a way to do that.

Write a function objectsEqual that accepts two object arguments and returns true or false depending on whether the objects have the same key/value pairs.
*/

function objectsEqual(obj1, obj2) {
  if (obj1 === obj2) return true;
  
  let obj1Keys= Object.keys(obj1);
  if (obj1Keys.length !== Object.keys(obj2).length) return false;

  for (let key of obj1Keys) {
    if (Object.hasOwn(obj2, key)) {
      if (obj1[key] !== obj2[key]) return false;
    } else {
      return false;
    }
  }

  return true;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({a: 'foo', b: 'bar'}, {b: "bar", a: 'foo'}));  // true
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false
