// Write a function that takes an array argument and returns a new array that contains the values from the input array in sorted order. The function should sort the array using the merge sort algorithm as described above. You may assume that every element of the array will be of the same data type—either all numbers or all strings.

// Feel free to use the merge function you wrote in the previous exercise.

function merge(array1, array2) {
  const copy1 = array1.slice();
  const copy2 = array2.slice();
  const result = [];

  while (copy1.length > 0 && copy2.length > 0) {
    result.push(copy1[0] <= copy2[0] ? copy1.shift() : copy2.shift());
  }

  return result.concat(copy1.length === 0 ? copy2 : copy1);
}

function mergeSort(array) {
  if (array.length === 1) return array;

  let subArr1 = array.slice(0, array.length / 2);
  let subArr2 = array.slice(array.length / 2);

  subArr1 = mergeSort(subArr1);
  subArr2 = mergeSort(subArr2);

  return merge(subArr1, subArr2);
}

mergeSort([9, 5, 7, 1]);               // [1, 5, 7, 9]
mergeSort([5, 3]);                     // [3, 5]
mergeSort([6, 2, 7, 1, 4]);            // [1, 2, 4, 6, 7]
mergeSort([9, 2, 7, 6, 8, 5, 0, 1]);   // [0, 1, 2, 5, 6, 7, 8, 9]

mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']);
// ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]);
// [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
