// Write a function that takes an array of arrays as an argument, and returns a new array that contains the sums of each of the sub-arrays.

function matrixSums(arr) {
  let sums = [];
  
  arr.forEach(subarr => {
    let sum = 0;
    
    subarr.forEach(number => {
      sum += Number(number);
    });

    sums.push(sum);
  });

  return sums;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]