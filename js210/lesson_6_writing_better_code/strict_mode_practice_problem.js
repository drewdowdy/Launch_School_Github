'use strict'; // added use strict pragma

const SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"]; // added const declaration
const RANKS = ["2", "3", "4", "5", "6", "7", "8", "9",
         "10", "Jack", "Queen", "King", "Ace"]; // added const declaration

function createDeck() {
  let allCards = () => { // added let declaration
    return SUITS.reduce((deck, suit) => { // removed `this`
      RANKS.forEach(rank => deck.push(`${rank} of ${suit}`)); // removed `this`
      return deck;
    }, []);
  };

   let deck = allCards(); // added let declaration
  shuffle(deck);

  return deck;
}

function shuffle(deck) {
  for (let counter = 0; counter < 400; counter += 1) { // added let declaration; removed leading zero
    let randomIndex1 = randomCardIndex(); // added let declaration
    let randomIndex2 = randomCardIndex(); // added let declaration
    let tempCard = deck[randomIndex1]; // added let declaration
    deck[randomIndex1] = deck[randomIndex2];
    deck[randomIndex2] = tempCard;
  }

  function randomCardIndex() {
    return Math.floor(Math.random() * deck.length); // removed `this`
  }
}

console.log(createDeck());
