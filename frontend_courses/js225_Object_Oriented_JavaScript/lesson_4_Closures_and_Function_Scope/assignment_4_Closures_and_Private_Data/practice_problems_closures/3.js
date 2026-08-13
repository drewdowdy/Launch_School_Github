// Given the following code:
// Is there a way to set the value of systemStatus to the value of the inner variable status without changing startup in any way? If so, how?

function startup() {
  let status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

let ready = startup();
let systemStatus = '' // ?

// Answer: No. Since `status` is defined within the function body of startup(), it's inaccessible outside the function definition. It makes the variable "private".
