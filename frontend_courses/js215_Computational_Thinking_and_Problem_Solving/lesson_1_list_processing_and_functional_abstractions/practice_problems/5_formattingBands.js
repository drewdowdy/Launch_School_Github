// Write a function that can process the input band Array and return an Array that contains the fixed information:
/*
Tasks:
- capitalize the value of 'name' property AND remove punctuation
  - toUpperCase, slice
- change value of 'country' to 'Canada'

We should be weary of side effects and abstract functions to have one specific duty.
*/

let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

const cleanUp = (string) => string.replace(/[^a-z0-9\s]/gi, '');

const titleCase = (words) => {
  return words
    .split(' ')
    .map(s => s[0].toUpperCase() + s.slice(1))
    .join(' ');
};

function processBands(data) {
  let newCountry = 'Canada';

  return data.map(band => {
    let newBandName = titleCase(cleanUp(band.name));

    return {
      name: newBandName,
      country: newCountry,
      active: band.active,
    }
  });
}

console.log(processBands(bands));

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]