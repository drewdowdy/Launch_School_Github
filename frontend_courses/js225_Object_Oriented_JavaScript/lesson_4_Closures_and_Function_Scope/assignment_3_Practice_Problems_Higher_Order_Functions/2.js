// Consider the code below.
// Of the two functions invoked (checkEven and filter), which is a higher-order function and why?

let numbers = [1, 2, 3, 4];
function checkEven(number) {
  return number % 2 === 0;
}

numbers.filter(checkEven); // [2, 4]

// My Answer:
// filter() is a higher-order function since it is accepting the function checkEven() as its argument.
