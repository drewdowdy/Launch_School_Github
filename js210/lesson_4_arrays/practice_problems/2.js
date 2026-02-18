/*
Create a function named rollCall that takes an array of first names as an argument and logs all the names to the console, one name per line. You should log the names in the same sequence that they appear in the array. Use a for loop to process the array.
*/

const rollCall = (array) => {
  for (let i = 0; i < array.length; i++) {
    console.log(array[i]);
  }
};

rollCall(['Cindy', 'Mindy', 'Mandy']);
