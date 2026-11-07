// Imagine you have two promises, firstResource and secondResource, that resolve after different intervals. Use Promise.race() to log the value of whichever promise resolves first.

const firstResource = new Promise((resolve) =>
  setTimeout(() => resolve("First resource loaded"), 500)
);
const secondResource = new Promise((resolve) =>
  setTimeout(() => resolve("Second resource loaded"), 1000)
);

Promise.race([firstResource, secondResource])
  .then((result) => console.log('Winner: ', result));
