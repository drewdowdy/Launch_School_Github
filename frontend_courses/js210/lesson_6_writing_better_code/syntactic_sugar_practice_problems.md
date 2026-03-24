# Practice Problems: Syntactic Sugar

## 1. Rewrite the following code using classic JavaScript syntax. That is, write it without using any of the shorthand notations described in the previous assignment.

```javascript
function foo(bar, qux, baz) {
  return {
    bar, // consise property initializers
    baz, // consise property initializers
    qux, // consise property initializers
  };
}
```

### Answer

```javascript
function foo(bar, qux, baz) {
  return {
    bar: bar,
    baz: baz,
    qux: qux,
  };
}
```

## 2. Rewrite the following code using classic JavaScript syntax:

```javascript
function foo() {
  return {
    bar() { // consise method definitions
      console.log("bar");
    },
    qux(arg1) { // consise method definitions
      console.log("qux");
      console.log(arg1);
    },
    baz(arg1, arg2) { // consise method definitions
      console.log("baz");
      console.log(arg1);
      console.log(arg2);
    },
  };
}
```

### Answer

```javascript
function foo() {
  return {
    bar: function() {
      console.log("bar");
    },
    qux: function(arg1) {
      console.log("qux");
      console.log(arg1);
    },
    baz: function(arg1, arg2) {
      console.log("baz");
      console.log(arg1);
      console.log(arg2);
    },
  };
}
```

## 3. Rewrite the following code using classic JavaScript syntax:

```javascript
function foo(one, two, three) {
  return {
    bar: one,
    baz: two,
    qux: three,
  };
}

let { baz, qux, bar } = foo(1, 2, 3); // object destructuring
```

### Answer

```javascript
function foo(one, two, three) {
  return {
    bar: one,
    baz: two,
    qux: three,
  };
}

let obj = foo(1, 2, 3);
let baz = obj.baz;
let qux = obj.qux;
let bar = obj.bar;
```

## 4. Rewrite the following code using classic JavaScript syntax:

```javascript
function foo([ one, , three ]) {
  return [
    three,
    5,
    one,
  ];
}

let array = [1, 2, 3];
let result = foo(array);
let [ bar, qux, baz ] = result; // array destructuring
```

### Answer

```javascript
function foo([ one, , three ]) {
  return [
    three,
    5,
    one,
  ];
}

let array = [1, 2, 3];
let result = foo(array);
let bar = result[0];
let qux = result[1];
let baz = result[2];
```

## 5. Rewrite the following code using classic JavaScript syntax:

```javascript
function product(num1, num2, num3) {
  return num1 * num2 * num3;
}

let array = [2, 3, 5];
let result = product(...array); // spread syntax
```

### Answer

```javascript
function product(num1, num2, num3) {
  return num1 * num2 * num3;
}

let array = [2, 3, 5];
let result = product(array[0], array[1], array[2]);
```

## 6. Rewrite the following code using classic JavaScript syntax:

```javascript
function product(...numbers) {// rest syntax
  return numbers.reduce((total, number) => total * number);
}

let result = product(2, 3, 4, 5);
```

### Answer

```javascript
function product() {
  let args = Array.from(arguments); // create an array from `arguments` object
  return args.reduce((total, number) => total * number);
}

let result = product(2, 3, 4, 5);
```

## 7. Replace the word `HERE` in the following code so the program prints the results shown:

```javascript
const HERE = { foo: 42, bar: 3.1415, qux: "abc" };
console.log(foo);         // 42
console.log(rest);        // { bar: 3.1415, qux: 'abc' }
```

### Answer

```javascript
{ foo, ...rest }
```

## 8. Rewrite the final line of code in the following snippet using classic JavaScript syntax:

```javascript
const obj = {
  first: "I am the first",
  second: "I am the second",
  third: [1, 2, 3],
  rest: { a: 'a', b: 'b' },
};

const { first, second, ...rest } = obj;
```

### Answer

```javascript
const first = obj.first;
const second = obj.second;
const rest = { // an object containing the remaining properties
  third: obj.third,
  rest: obj.rest,
};
```

## 9. **OPTIONAL** Assume that you have some code that looks like this. Using shorthand notation, what is the missing code?

```javascript
function qux() {
  let animalType = "cat";
  let age = 9;
  let colors = ["black", "white"];
  // missing code
}

let { type, age, colors } = qux();
console.log(type);    // cat
console.log(age);     // 9
console.log(colors);  // [ 'black', 'white' ]
```

### Answer

```javascript
return {
  type: animalType,
  age,
  colors,
}
```

## 10. OPTIONAL Write a function that takes 5 string arguments, and returns an object with 3 properties:

- `first`: the first argument
- `last`: the last argument
- `middle`: the middle 3 arguments as a sorted array

After writing the function, write some code to call the function. 

The arguments you provide should come from an array. You should create local variables named first, last, and middle from the return value.

Use shorthand syntax wherever you can.

### Answer

```javascript
function myFunction(...strings) { // rest syntax
  let first = strings[0];
  let middle = strings.slice(1, -1).sort();
  let last = strings[strings.length - 1];

  return {
    first,  // concise property initializer
    middle, // concise property initializer
    last,   // concise property initializer
  }
}

let array = ['here', 'are', 'five', 'different', 'strings'];

let { first, middle, last } = myFunction(...array); // spread syntax; object destructuring

console.log(first);  // 'here'
console.log(middle); // [ 'are', 'different', 'five' ]
console.log(last);   // 'strings'
```
