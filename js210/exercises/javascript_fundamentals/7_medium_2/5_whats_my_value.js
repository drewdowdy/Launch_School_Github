// What will the following program log to the console? Can you explain why?

const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges'; // array --> ['Apples', 'Peaches', 'Grapes', '3.4': 'Oranges]
console.log(array.length);              // > 3 (JS only counts positive integer indices)
console.log(Object.keys(array).length); // > 4 (includes strange keys)

array[-2] = 'Watermelon'; // array --> ['Apples', 'Peaches', 'Grapes', '3.4': 'Oranges, '-2': 'Watermelon']
console.log(array.length); // > 3
console.log(Object.keys(array).length); // > 5
