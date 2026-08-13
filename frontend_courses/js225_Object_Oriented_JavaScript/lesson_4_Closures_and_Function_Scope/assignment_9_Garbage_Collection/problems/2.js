// In the following code, when can JavaScript garbage collect the value ["Steve", "Edie"]?

function makeHello(names) {
  return function() {
    console.log("Hello, " + names[0] + " and " + names[1] + "!");
  };
}

let helloSteveAndEdie = makeHello(["Steve", "Edie"]);

/*
Answer:

Since name is part of the closure of helloSteveAndEdie, it can't be collected because it's still being referenced. 

It can be garbage collected when helloSteveAndEdie no longer references it.
*/
