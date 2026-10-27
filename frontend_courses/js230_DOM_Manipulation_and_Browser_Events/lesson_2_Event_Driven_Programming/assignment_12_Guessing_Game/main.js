document.addEventListener('DOMContentLoaded', () => {
  let link = document.querySelector('a');
  let form = document.querySelector('form');
  let paragraph = document.querySelector('p');
  let input = document.querySelector('#guess');
  let guessButton = document.querySelector('[type="submit"]');
  let answer;
  let guessNum;
  
  function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
  }

  function generateMessage(guess) {
    if (answer < guess) {
      return `My number is lower than ${guess}`;
    } else if (answer > guess) {
      return `My number is higher than ${guess}`;
    } else if (answer === guess) {
      guessButton.disabled = true;
      return `You guessed it! It took you ${guessNum} guesses`;
    }
  }

  function newGame() {
    guessButton.disabled = false;
    answer = getRandomInt(1, 100);
    guessNum = 0;
    input.value = '';
    paragraph.textContent = 'Guess a number from 1 to 100';
  }
  
  link.addEventListener('click', (event) => {
    event.preventDefault();
    newGame();
  })
  
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    let guess = parseInt(input.value, 10);
    let message

    if (isNaN(guess)) {
      message = 'You can only guess a number.';
    } else {
      guessNum++;
      message = generateMessage(guess);
    }
    
    paragraph.textContent = message;
  })

  newGame();
})