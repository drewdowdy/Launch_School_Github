/*
6. Using the following code, write some JavaScript to add a character counter that updates as the user types.
(if the script tag is before the body, need to create an event listener with DOMContentLoaded)
*/

document.addEventListener('DOMContentLoaded', () => {
  let textArea = document.querySelector('textarea');
  let postButton = document.querySelector('button');
  let counter = document.querySelector('.counter');

  counter.textContent = `140 characters remaining`;
  
  document.addEventListener('keyup', () => {
    let length = textArea.value.length;
    let remaining = 140 - length;
    let invalid = remaining < 0;

    textArea.classList.toggle('invalid', invalid);
    postButton.disabled = invalid;

    counter.textContent = `${remaining} characters remaining`;
  })
})
