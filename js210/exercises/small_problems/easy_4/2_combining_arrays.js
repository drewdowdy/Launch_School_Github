// Write a function that takes two arrays as arguments and returns an array containing the union of the values from the two. There should be no duplication of values in the returned array, even if there are duplicates in the original arrays. You may assume that both arguments will always be arrays.

function union(array1, array2) {
  let newArray = array1.slice(); // makes a copy

  for (let i = 0; i < array2.length; i += 1) {
    if (!(newArray.includes(array2[i]))) {
      newArray.push(array2[i]);
    }
  }

  console.log(newArray);
  return newArray;
}

union([1, 3, 5], [3, 6, 9]);    // [1, 3, 5, 6, 9]
