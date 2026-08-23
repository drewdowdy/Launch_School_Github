/*
- Write a textual description of the problem.

The dealer deals out 2 cards from the deck to the player and 2 to themselves.
The dealer reveals one of their cards.
The player can decide to hit (get a card from the deck into their hand) as many times as they want or stay (no card). 
If the player's total goes over 21, they immediately bust and lose the game.
The dealer can decide to hit (get a card from the deck into their hand) as many times as they want or stay (no card).
If the dealers's total goes over 21, they immediately bust and lose the game.
If neither the dealer or the player busts, then the one who's total is closest to 21 wins.

- Extract the significant nouns and verbs from the description.

Nouns: dealer, player, card, deck, total, hand
Verbs: deal, hit, stay, win, bust,

- Organize and associate the verbs with the nouns.

                                     +------+
    -------------------------------> | Stay |
    |               |                +------+
+--------+     +--------+
|        |     |        |
| Dealer |     | Player |
|        |     |        |
+--------+     +--------+
|    |   |           |  |
|    |   ----------------------------
|    |    +------+   |    +------+  |
|    ---> | Hand |   ---> | Hand |  |
|         +------+        +------+  |
|           |               |       |    +-----+
|           |               |       ---> | Hit |
|           |               |            +-----+
|           |               |               |
|           |               |               |
+------+    |               |               |
|      |    |--> +------------+             |
| Deck |-------> | Card (x52) | <------------
|      |         +------------+
+------+

*/

// === Helpers ===

let readLines = require('readline-sync');
let shuffle = require('shuffle-array');

function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min) + min);
}

function waitingAnimation(message, duration) {
  console.log('');
  process.stdout.write(message);

  for (let i = 0; i < 4; i++) {
    sleep(duration);
    process.stdout.write('.');
  }
}

function sleep(ms) {
  let end = Date.now() + ms;
  while (Date.now() < end) { /*Do nothing*/ };
}

// === Classes ===

class Game {
  static BUST_LIMIT = 21;
  static PROCESS_TIME = 500;

  constructor() {
    this.deck = new Deck();
    this.human = new Human();
    this.dealer = new Dealer();
  }

  play() {
    this.setupGame();
    let winningMessage = '';

    for (let player of [this.human, this.dealer]) {
      this.playTurn(player);

      if (player.busted) {
        let msg = player instanceof Human ? 'You busted! Looks like you lose.' : 'Dealer busted! You\'re a winner, baby!';
        this.gameOver(msg);

        return;
      }
    }

    this.dealer.unhideCards();
    this.displayHands();

    let winner = this.determineWinner();
    
    if (winner instanceof Dealer) {
      winningMessage = 'Dealer has a better score. You lose.'
    } else if (winner instanceof Human) {
      winningMessage = 'Human has a better score. You\'re the winner!';
    } else if (winner === 'tie') {
      winningMessage = 'You both have the same score. It\'s a tie!';
    }
    
    this.gameOver(winningMessage);
  }

  setupGame() {
    this.human.addCard(this.deck.getRandomCard());
    this.human.addCard(this.deck.getRandomCard());

    let hiddenCard = this.deck.getRandomCard();
    hiddenCard.hidden = true;
    this.dealer.addCard(hiddenCard);
    this.dealer.addCard(this.deck.getRandomCard());

    this.displayHands();
  }

  displayHands() {
    console.clear();
    this.dealer.displayHand();
    this.human.displayHand();
  }

  playTurn(player) {
    if (player instanceof Dealer) waitingAnimation('Dealer is thinking', Dealer.THINK_TIME);
    let move = player.move();

    while (move !== 'stay') {
      player.addCard(this.deck.getRandomCard());
      if (player.busted) return;
      
      this.displayHands();
      console.log(`${player.constructor.name} decided to hit!`);
      
      move = player.move();
    }
    
    console.log(`${player.constructor.name} decided to stay!`);
  }

  gameOver(message) {
    this.dealer.unhideCards();
    waitingAnimation('Processing result', Game.PROCESS_TIME);
    this.displayHands();

    console.log(`Dealer score: ${this.dealer.totalPoints}`);
    console.log(`Human score: ${this.human.totalPoints}`);
    console.log('');
    console.log(message);
  }

  determineWinner() {
    let humanDiff = Game.BUST_LIMIT - this.human.totalPoints;
    let dealerDiff = Game.BUST_LIMIT - this.dealer.totalPoints;

    if (humanDiff === dealerDiff) return 'tie';
    return humanDiff < dealerDiff ? this.human : this.dealer;
  }
}

class Deck {
  constructor() {
    this.cards = shuffle(this.makeAllCards());
  }

  getRandomCard() {
    return this.cards.pop();
  }
  
  makeAllCards() {
    let cards = [];
    
    for (let suit of Card.SUITS) {
      for (let number of Card.NUMBERS) {
        cards.push(new Card(number, suit));
      }
    }
    
    return cards;
  }

  showAllCards() {
    for (let card of this.cards) {
      card.display();
    }
  }
}

class Card {
  static SUITS = ['♧', '♡', '◇', '♤'];
  static NUMBERS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];

  constructor(number, suit, hidden = false) {
    this.number = number;
    this.suit = suit;
    this.hidden = hidden;
  }

  lines() {
    if (this.hidden) {
      return [
        '+-----+',
        '|?    |',
        '|  ?  |',
        '|    ?|',
        '+-----+'
      ];
    }

    let num = this.number.padEnd(2);

    return [
      '+-----+',
      `|${num}   |`,
      `|  ${this.suit}  |`,
      `|   ${this.number.padStart(2)}|`,
      '+-----+',
    ];
  }

  get points() {
    if (isNaN(Number(this.number))) {
      return this.number === 'A' ? 11 : 10;
    }

    return Number(this.number);
  }
}

class Player {
  constructor() {
    this.hand = [];
  }

  displayHand() {
    let allLines = this.hand.map(c => c.lines());
    let cardHeight = allLines[0].length;

    console.log(`${this.constructor.name}'s hand:`);

    for (let i = 0; i < cardHeight; i++) {
      let row = allLines.map(c => c[i]).join('  ');
      console.log(row);
    }
  }

  get totalPoints() {
    let [ sum, aceCount ] = this.hand.reduce((resultArr, card) => {
      resultArr[0] += card.points;
      if (card.number === 'A') resultArr[1] += 1;
      return resultArr;
    }, [0, 0]);

    for (let i = 0; i < aceCount; i++) {
      if (sum > Game.BUST_LIMIT) sum -= 10;
    }

    return sum;
  }

  get busted() {
    return this.totalPoints > Game.BUST_LIMIT;
  }

  addCard(card) {
    this.hand.push(card);
  }
}

class Human extends Player {
  constructor() {
    super();
  }

  move() {
    console.log(`Your current total is ${this.totalPoints}`);
    console.log('What would you like to do?');
    let choice = readLines.keyInSelect(['Hit', 'Stay']);
    
    return choice === 0 ? 'hit' : 'stay';
  }
}

class Dealer extends Player {
  static THINK_TIME = 500;
  static POINT_LIMIT = 17;

  constructor() {
    super();
  }

  unhideCards() {
    this.hand.forEach(card => card.hidden = false);
  }

  move() {
    if (this.totalPoints < Dealer.POINT_LIMIT) return 'hit';
    return 'stay';
  }
}

let game = new Game();
game.play();
