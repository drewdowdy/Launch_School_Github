// Consider the code below
// Is the object created and assigned to foo on line 2 eligible for garbage collection on line 11?

function makeGreeting() {
  let foo = { greeting: 'hello' };
  return function(name) {
    foo.name = name;
    return foo;
  };
}

let greeting = makeGreeting();

// is the object eligible for GC here?

// more code

/*
Answer:
No. It's part of the closure of the function referenced by greeting. So, until greeting no longer references that function, it can't be eligible for GC.
*/