// Using this method, create a function that constructs a new object with a log method that is read-only. The log method will use console.log to output the name property on itself.

function newPerson(name) {
  let person = {
    name,
  }

  return Object.defineProperties(person, {
    log: {
      value() {
        console.log(this.name);
      },
      writable: false,
    }
  });
}

let me = newPerson('Shane Riley');
me.log();     // => Shane Riley
me.log = function() { console.log('Amanda Rose'); };
me.log();     // => Shane Riley
