# Practice Problems

## 1. What side effects are present in the foo function in the following code?

```javascript
const bar = 42;
let qux = [1, 2, 3];
let baz = 3;

function foo(arr) {
  let value = arr.pop();
  console.log(`popped ${value} from the array`);
  return value + bar + baz;
}

foo(qux);
```
### Answer

There are **2 side effects**

1. line 8 *mutates* the array referenced by `arr`
2. line 9 *writes* to the console

## 2. Which of the following functions are pure functions?

- function 1

```javascript
function sum(a, b) {
  console.log(a + b);
  return a + b;
}
```

- function 2

```javascript
function sum(a, b) {
  a + b;
}
```

- function 3

```javascript
function sum(a, b) {
  return a + b;
}
```

- function 4

```javascript
function sum(a, b) {
  return a + b + Math.random();
}
```

- function 5

```javascript
function sum(a, b) {
  return 3.1415;
}
```

### Answer


- function 1: has a side effect. not pure
- function 2: returns a consistent value. **pure**
- function 3: returns consistent value. **pure**
- function 4: changes the random number generator. not pure
- function 5: returns a consistent value. **pure**

In this case, only `function 2`, `function 3`, and `function 5` are pure. Pure functions have a consistent result given the arguments.
