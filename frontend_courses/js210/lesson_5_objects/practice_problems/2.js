// Write a function named incrementProperty that takes two arguments: an Object and a String. If the Object contains a property with the specified name, the function should increment the value of that property. If the property does not exist, the function should add a new property with a value of 1. The function should return the new value of the property.

function objectHasProperty(obj, str) {
  return Object.keys(obj).indexOf(str) >= 0;
}

function incrementProperty(obj, str) {
  if (obj[str]) {
    obj[str] += 1;
  } else {
    obj[str] = 1;
  }
}

let wins = {
  steve: 3,
  susie: 4,
};

incrementProperty(wins, 'susie');   // 5
wins;                               // { steve: 3, susie: 5 }
incrementProperty(wins, 'lucy');    // 1
wins;                               // { steve: 3, susie: 5, lucy: 1 }
