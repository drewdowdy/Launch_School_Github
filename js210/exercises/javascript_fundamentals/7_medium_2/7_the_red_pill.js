// Read through the code below and determine what will be logged. You may refer to the ASCII Table to look up character code values.

function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101)); // (1) > Welcome
    anotherOne(116, 111); // (2) > to
  }

  anotherAnotherOne(); 
  anotherOne(116, 104, 101); // (3) > the
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33); // (4) > Matrix

// > Welcome
// > to
// > the
// > Matrix!
