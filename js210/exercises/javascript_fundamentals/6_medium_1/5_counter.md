# Counter

## What will the following code snippets log?

### 1.

```javascript
var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}
```

#### Answer

```
> The total value is 15
```

Hoisting:

1. The function `counter()` with its body
2. The `var` declarations of `counter` and `rate`

Then the program is executed line by line. So `counter` is reassigned to `5`. So in the string interpolation, `counter` references `5`.

### 2.

```javascript
function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;
```

#### Answer

```
The total value is NaN
```

Hoisting:

- The function `counter()` with its method body
- The `var` declarations of `counter` and `rate` initialized to `undefined`

> Note: The hoisting of `var counter` does not overwrite the function that `counter` already references. The `var` declaration is considered redundant and ignored.

Since the `console.log()` occurs before the assignment of `counter = 5`, it currently references a function so when we attempt to do math with it, it becomes `NaN`.

### 3.

```javascript
var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
```

#### Answer

```
> The total value is 15
```

After hoisting, this is functionally the same as number 1.

### 4.

```javascript
let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
```

#### Answer

```
> SyntaxError: Identifier 'counter' has already been declared
```

Hoisting:

- The `counter()` function with its body
- JS attempts to hoist variable `counter` but... 

Since a variable `counter` already exists, we can't declare a new variable with `let` using the same name, so an error is thown.
