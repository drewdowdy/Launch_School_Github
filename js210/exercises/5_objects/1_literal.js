// Identify the bug in the following code. Don't run the code until after you've tried to answer.

const myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1]; // ok   : JS converts 1 to string '1'
myObject[a]; // error: needs to be string 'a'
myObject.a;  // ok   : property names in dot notation don't need quotes 

/*
- on line 11, we don't pass the string 'a' in the bracket notation. instead it's an unreferenced variable called a.
*/ 
