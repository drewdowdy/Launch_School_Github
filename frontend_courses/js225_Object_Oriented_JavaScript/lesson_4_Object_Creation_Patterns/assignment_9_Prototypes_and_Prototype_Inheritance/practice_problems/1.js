// Write a function that returns the object on a given object's prototype chain where a property is defined. See the example code below:

function getDefiningObject(object, propKey) {
  let proto = Object.getPrototypeOf(object);

  while (proto !== null) {
    if (proto.hasOwnProperty(propKey)) {
      return proto;
    }
    
    proto = Object.getPrototypeOf(proto);
  }

  return proto;
}

let foo = {
  a: 1,
  b: 2,
};

let bar = Object.create(foo);
let baz = Object.create(bar);
let qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // => true
console.log(getDefiningObject(qux, 'e'));             // => null
