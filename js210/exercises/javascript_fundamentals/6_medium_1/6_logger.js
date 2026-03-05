// Read through the following code. Why will it log 'debugging'?

function debugIt() {
  const status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

// Due to lexical scoping, the variable `status` is available within the inner scope of the body of `logger()`.
// Inner scopes can access outer scopes but outer scopes can't access inner scopes.
