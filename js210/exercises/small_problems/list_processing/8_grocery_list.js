// Write a function that takes a grocery list in a two-dimensional array and returns a one-dimensional array. Each element in the grocery list contains a fruit name and a number that represents the desired quantity of that fruit. The output array is such that each fruit name appears the number of times equal to its desired quantity.

// In the example below, we want to buy 3 apples, 1 orange, and 2 bananas. Thus, we return an array that contains 3 apples, 1 orange, and 2 bananas.

function buyFruit(fruitArr) { 
  let result = [];

  for (pair of fruitArr) {
    let fruit = pair[0];
    let count = pair[1];

    for (let i = 1; i <= count; i += 1) {
      result.push(fruit);
    }
  }

  console.log(result);
  return result;
}

buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]);
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
