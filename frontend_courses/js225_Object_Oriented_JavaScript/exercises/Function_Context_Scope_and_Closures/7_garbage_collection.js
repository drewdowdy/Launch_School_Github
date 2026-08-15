// Read the following code carefully. Will the JavaScript garbage collection mechanism garbage collect the array assigned to the variable array after the function pushIt is called on line 13?

function makeArrays() {
  let array = [];

  return () => {
    array.push('');
    return array;
  };
}

const pushIt = makeArrays();
pushIt();
// more code

// Answer:
// No. Since pushIt references the array in the global scope, it's not eligible for GC until the program finishes execution.
