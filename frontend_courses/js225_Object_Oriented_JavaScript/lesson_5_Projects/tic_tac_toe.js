/*
Tic Tac Toe:

- Write a textual description of the problem.

The game has 2 players. Could be a human and a computer.
There is a board with 9 squares arranged as a grid.
The first player chooses a square and puts an X there.
The second player chooses a differend square and puts an O there.
The player who successfully get 3 in a row wins. 3 in a row can be diagonal, vertical, or horizontal.

- Extract the significant nouns and verbs from the description.

Nouns: game, player, human, computer, move, X, O, square, grid
Verbs: move, choose, win

- Organize and associate the verbs with the nouns.

+------+
|      |           +----------+
| Game |---------> | Player 1 |------
|      |-------    +----------+     |     +------+
+------+      |                     ----> | Move |
    |         |    +----------+     |     +------+
    |         ---> | Player 2 |------        |
    |              +----------+              |
    |                                        |
    |   +------+                             |
    --> |      |       +-------------+       |
        | Grid |-----> | Square (x9) | <------
        |      |       +-------------+
        +------+
  
=== GAME FLOW ===

1. Display welcome message
2. Display the board
3. WHILE there is no winner
  - Player chooses a square
  - Computer chooses a square
  - Display the new board with chosen squares
4. Announce the winner (human, computer or tie)
5. Display goodbye message

*/

/*
=== SINGLE QUESTION ===
let answer = readlineSync.question(question);

=== MULTIPLE CHOICE ===
animals = ['Lion', 'Elephant', 'Crocodile', 'Giraffe', 'Hippo'],
index = readlineSync.keyInSelect(animals, 'Which animal?');
console.log(`You chose the ${animals[index]}!`);

=== Y/N QUESTIONS ===
readlineSync.keyInYN('Do you like ice cream?' ? console.log('Me too!') : console.log('Ew weirdo...');
*/

const readlineSync = require('readline-sync');

class Game {
  constructor() {
    this.human = new Human();
    this.computer = new Computer();
    this.grid = new Grid(this.human, this.computer);
    this.currentPlayer = this.human;
  }

  play() {
    this.displayWelcomeMessage();
    
    while (true) {
      this.grid.display();
      let moveFinished = this.currentPlayer.move(this.grid);
      
      this.grid.updateWinner();
      if (this.grid.isGameOver()) break;

      if (moveFinished) {
        this.currentPlayer = this.togglePlayer(this.currentPlayer);
      }
    }
    
    this.grid.display();
    this.displayResult(this.grid.winner);
  }

  displayWelcomeMessage() {
    console.clear();
    console.log('=== Welcome to Tic Tac Toe! ===');
    console.log('');
  }

  getPlayer(mark) {
    return [this.human, this.computer].find(p => p.mark === mark);    
  }

  displayResult(winner) {
    if (winner instanceof Human) {
      console.log('Congratulations! You beat the computer!');
    } else if (winner instanceof Computer) {
      console.log('The computer won. Better luck next time.');
    } else if (this.grid.isTie) {
      console.log("It's a tie! Everyone wins!");
    }
  }

  togglePlayer(player) {
    return player instanceof Human ? this.computer : this.human;
  }
}

class Grid {
  static WINNING_COMBINATIONS = [
    [0, 1, 2], // top row
    [3, 4, 5], // middle row
    [6, 7, 8], // bottom row
    [0, 4, 8], // diagonal L/R
    [2, 4, 6], // diagonal R/L
    [0, 3, 6], // left column
    [1, 4, 7], // middle column
    [2, 5, 8], // right column
  ];

  constructor(...players) {
    this.players = players;
    this.squares = [
      new Square(), new Square(), new Square(),
      new Square(), new Square(), new Square(),
      new Square(), new Square(), new Square(),
    ];

    this.winner = null;
    this.isTie = false;
  }

  display() {
    console.clear();

    console.log(' 1 | 2 | 3 ');
    console.log(` ${this.squares[0].mark} | ${this.squares[1].mark} | ${this.squares[2].mark} `);
    console.log('___|___|___');
    console.log(' 4 | 5 | 6 ');
    console.log(` ${this.squares[3].mark} | ${this.squares[4].mark} | ${this.squares[5].mark} `);
    console.log('___|___|___');
    console.log(' 7 | 8 | 9 ');
    console.log(` ${this.squares[6].mark} | ${this.squares[7].mark} | ${this.squares[8].mark} `);
    console.log('   |   |   ');
  }
  
  isGameOver() {
    return !!this.winner || this.isTie;
  }

  isFull() {
    return this.squares.every(s => s.mark !== Square.EMPTY_SQUARE);
  }

  updateWinner() {
    for (let [ a, b, c ] of Grid.WINNING_COMBINATIONS) {
      let SquareA = this.squares[a];
      let SquareB = this.squares[b];
      let SquareC = this.squares[c];

      if ([SquareA, SquareB, SquareC].some(s => s.isEmpty())) continue;

      if (SquareA.mark === SquareB.mark
          && SquareB.mark === SquareC.mark) {
            this.winner = this.players.find(p => p.mark === SquareA.mark);
            break;
      }
    }
    
    if (!this.winner) {
      if (this.isFull()) {
        this.isTie = true;
      }
    }
  }
}

class Square {
  static EMPTY_SQUARE = ' ';
  static HUMAN_MARKER = 'X';
  static COMPUTER_MARKER = 'O';

  constructor(mark = Square.EMPTY_SQUARE) {
    this.mark = mark;
  }

  isEmpty() {
    return this.mark === Square.EMPTY_SQUARE;
  }
}

class Player {
  constructor(mark) {
    this.mark = mark;
  }
}

class Human extends Player {
  constructor() {
    super(Square.HUMAN_MARKER);
  }

  move(grid) {
    let squareIdx;
    let options = grid.squares.map((square, idx) => {
      return square.isEmpty() ? '' : `Taken`;
    });

    while (true) {
      squareIdx = readlineSync.keyInSelect(options, 'Which square do you choose?');
      
      if (squareIdx === -1) {
        console.log('Move cancelled.');
        return false;
      }
      
      if (grid.squares[squareIdx].isEmpty()) {
        break;
      } 
      
      grid.display();
      readlineSync.question('Invalid square. Press Enter to choose again.');
    }

    grid.squares[squareIdx].mark = this.mark;
    return true;
  }
}

class Computer extends Player {
  constructor() {
    super(Square.COMPUTER_MARKER);
  }

  move(grid) {
    this.think();

    let notChosen = true;
    let squareIdx;

    while(notChosen) {
      squareIdx = this.getRandomInt(0, grid.squares.length - 1);
      if (grid.squares[squareIdx].isEmpty()) notChosen = false;
    }

    grid.squares[squareIdx].mark = this.mark;
    return true;
  }

  getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
  }

  think() {
    process.stdout.write('Computer is thinking');

    for (let i = 0; i < 4; i++) {
      this.sleep(500);
      process.stdout.write('.');
    }
  }

  sleep(ms) {
    let end = Date.now() + ms;
    while (Date.now() < end) { /*Do nothing*/ };
  }
}

let game = new Game();
game.play();
