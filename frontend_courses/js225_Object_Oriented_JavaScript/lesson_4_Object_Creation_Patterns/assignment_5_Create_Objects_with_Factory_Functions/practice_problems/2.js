// Rewrite the code below to use object-literal syntax to generate the returned object:

function makeObj() {
  let obj = {};
  obj.propA = 10;
  obj.propB = 20;
  return obj;
}

// rewrite
function makeObj() {
  return {
    propA: 10,
    propB: 20,
  };
}
