// Is the named function in this IIFE accessible in the global scope?

(function foo() {
  console.log('Bar');
})();

foo() // ?

// Answer:
// No. Since it's invoked as soon as it's declared, it's not kept in the global scope. It's scope is only in the parenthesis of the IIFE
