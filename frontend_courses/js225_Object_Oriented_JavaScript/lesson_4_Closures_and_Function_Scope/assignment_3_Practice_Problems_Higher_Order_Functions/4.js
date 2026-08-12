// Implement execute below, such that the return values for the two function invocations match the commented values.

function execute(func, operand) {
  func(operand);
}

execute(function(number) {
  return number * 2;
}, 10); // 20

execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy'); // "HEY THERE BUDDY"
