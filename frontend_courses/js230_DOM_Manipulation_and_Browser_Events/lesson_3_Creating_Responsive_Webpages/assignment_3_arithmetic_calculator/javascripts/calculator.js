document.addEventListener('DOMContentLoaded', () => {
  function makeCalculator(operator) {
    return function(a, b) {
      switch (operator) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return a / b;
      }
    }
  }

  let form = document.body.querySelector('form');
  
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    
    let first = document.body.querySelector('#first-number');
    let second = document.body.querySelector('#second-number');
    
    let firstNum = Number(first.value);
    let secondNum = Number(second.value);
    let operator = document.body.querySelector('#operator').value;

    let calculate = makeCalculator(operator);
    let calculation = calculate(firstNum, secondNum);

    document.body.querySelector('#result').textContent = String(calculation);
  })
})