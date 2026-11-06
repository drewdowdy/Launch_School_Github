// Practice chaining promises by creating a chain of four promises. The first promise should resolve with a number; then, the chain should double the number and add 5 in successive .then() calls. Log the result after the final operation.

Promise.resolve(5)
  .then((num) => num * 2)
  .then((num) => num + 5)
  .then((num) =>console.log(num))