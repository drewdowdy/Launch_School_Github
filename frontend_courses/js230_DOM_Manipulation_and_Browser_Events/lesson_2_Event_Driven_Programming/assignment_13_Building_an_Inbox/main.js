document.addEventListener('DOMContentLoaded', () => {
  let textField = document.querySelector('.text-field');
  let intervalId;

  textField.addEventListener('click', (event) => {
    event.stopPropagation();

    textField.classList.add('focused');
    intervalId = intervalId || setInterval(() => textField.classList.toggle('cursor'), 500);
  })

  document.addEventListener('click', () => {
    clearInterval(intervalId);
    intervalId = null;
    textField.classList.remove('focused');
    textField.classList.remove('cursor');
  })


  document.addEventListener('keydown', (event) => {
    if (textField.classList.contains('focused')) {
      let content = document.querySelector('.content');
      let key = event.key;

      if (key === 'Backspace') {
        content.textContent = content.textContent.slice(0, -1);
      } else if (key.length === 1) {
        content.textContent += key;
      }
    }
  })
})
