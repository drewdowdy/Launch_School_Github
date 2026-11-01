class Game {
  static #MAX_INCORRECT = 6;
  static #words = ['apple', 'banana', 'orange', 'pear'];
  #selectedWord;

  static getRandomWord() {
    let idx = Math.floor(Math.random() * Game.#words.length);
    return Game.#words.splice(idx, 1).pop();
  }

  constructor() {
    if (Game.#words.length === 0) throw new Error('No more words to choose.');

    this.#selectedWord = Game.getRandomWord().split('');
    this.wordState = this.#selectedWord.map(() => '');
    this.guessedLetters = [];
    this.incorrectGuesses = 0;
  }

  makeGuess(letter) {
    this.guessedLetters.push(letter);

    let indices = this.#selectedWord.reduce((result, correctLetter, idx) => {
      if (letter === correctLetter) result.push(idx);
      return result;
    }, [])

    if (indices.length < 1) {
      this.incorrectGuesses++;
    } else {
      indices.forEach(i => this.wordState[i] = letter);
    }
  }

  get hasWon() {
    return !this.wordState.includes('');
  }

  get hasLost() {
    return this.incorrectGuesses === Game.#MAX_INCORRECT;
  }

  get gameOver() {
    return this.hasWon || this.hasLost;
  }

  static get remainingWordsNum() {
    return Game.#words.length;
  }
}

class GameUI {
  constructor() {
    this.apples = document.getElementById('apples');
    this.replay = document.getElementById('replay');
    this.message = document.getElementById('message');
    this.spacesDiv = document.getElementById('spaces');
    this.spaces = [];
    this.guessesDiv = document.getElementById('guesses');

    try {
      this.game = new Game();
    } catch (error) {
      this.message.textContent = 'There are no more words. Please refresh the page.';
      this.hideReplay();
      return;
    }

    this.setUpGame();
  }

  hideReplay() {
    this.replay.classList.remove('visible');
  }

  revealReplay() {
    this.replay.classList.add('visible');
  }

  processGuess= (event) => {
    let letter = event.key.toLowerCase();
    if (!/^[a-z]$/.test(letter) || this.game.guessedLetters.includes(letter)) return;

    this.game.makeGuess(letter);

    this.setRemainingApples(this.game.incorrectGuesses);
    this.renderWordState();
    this.addGuess(letter);

    if (this.game.gameOver) {
      let outOfWords = Game.remainingWordsNum === 0;

      let msg = this.game.hasWon ? 'You won!' : 'Sorry, you are out of guesses.';
      
      let status = this.game.hasWon ? 'win' : 'lose';
      this.setGameStatus(status);
      
      if (outOfWords) {
        msg += ' No more words to choose. Please refresh the page.';
        this.setUpRefresh();
        this.revealReplay();
      } else {
        this.revealReplay();
        this.removeListener();
      }

      this.displayMessage(msg);
    }    
  }

  setUpRefresh() {
    this.replay.removeEventListener('click', restartGame);
    this.replay.textContent = 'Refresh';

    this.replay.addEventListener('click', (e) => {
      e.preventDefault();
      location.reload();
    })
  }

  activateListener() { document.addEventListener('keyup', this.processGuess) }
  removeListener() { document.removeEventListener('keyup', this.processGuess) }

  setRemainingApples(num) {
    this.apples.className = `guess_${num}`;
  }

  displayMessage(text) {
    this.message.textContent = text;
  }

  removeGuesses() {
    this.guessesDiv.querySelectorAll('span').forEach(s => s.remove());
  }

  removeBlankSpaces() {
    this.spacesDiv.querySelectorAll('span').forEach(s => s.remove());
    this.spaces = [];
  }

  renderBlankSpaces(letters) {
    letters.forEach(() => {
      let span = document.createElement('span');
      this.spacesDiv.append(span);
      this.spaces.push(span);
    })
  }

  setGameStatus(status) {
    document.body.classList.remove('win', 'lose');
    if (status) document.body.classList.add(status);
  }

  renderWordState() {
    this.game.wordState.forEach((letter, idx) => {
      this.spaces[idx].textContent = letter;
    })
  }

  addGuess(letter) {
    let span = document.createElement('span')
    span.textContent = letter;
    this.guessesDiv.append(span);
  }

  setUpGame() {
    this.activateListener();
    this.hideReplay();
    this.setRemainingApples(0);
    this.displayMessage('');
    this.removeGuesses();
    this.removeBlankSpaces();
    this.renderBlankSpaces(this.game.wordState);
    this.setGameStatus();
  }
}

function restartGame(e) {
  e.preventDefault();
  new GameUI();
}

document.addEventListener('DOMContentLoaded', () => {
  new GameUI();

  document.querySelector('#replay').addEventListener('click', restartGame);
})
