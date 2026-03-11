// Write a function that counts the number of occurrences of each element in a given array. Once counted, log each element alongside the number of occurrences.

function countOccurrences(array) {
  let counts = {};

  for (let i = 0; i < array.length; i += 1) {
    let currentItem = array[i];

    if (counts[currentItem] === undefined) {
      counts[currentItem] = 1;
    } else {
      counts[currentItem] += 1;
    }
  }

  // Object.keys(counts).forEach(item => {
  //   console.log(`${item} => ${counts[item]}`);
  // })

  for (let item in counts) {
    console.log(`${item} => ${counts[item]}`);
  }
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
// suv => 1
