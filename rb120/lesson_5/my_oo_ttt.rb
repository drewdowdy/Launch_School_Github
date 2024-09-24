=begin

1. Write a description of the problem and extract major nouns and verbs.
2. Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
3. Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

spike - exploratory code to play with the problem
CRC - Class Reponsibility Collaborator

1. 

Steps of TTT Gameplay

1. Decide who chooses first.
2. Blank board is displayed.
3. Player 1 chooses a spot on the board.
4. Determine if there's a winner OR if the board is full.
5. Updated board is displayed.
6. Player 2 chooses a spot on the board.
7. Determine if there's a winner OR if the board is full.
8. Repeat steps 3-7 until there's a winner or board is full.
9. Display the winner.
10. Ask player if they'd like to play again.

2. 
Nouns: board, player, spot, winner, move
Verbs: choose, display, determine, play

=end

class Player
  def choose
    # choose a spot on the board
    # number the spots 1-9
  end
end

class Board
  attr_accessor :squares

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new(' ') }
  end

  def get_square_at(key)
    @squares[key]
  end

  def state
    [
      "   |   |   ",
      " #{get_square_at(1)} | #{get_square_at(2)} | #{get_square_at(3)} ",
      "___|___|___",
      "   |   |   ",
      " #{get_square_at(4)} | #{get_square_at(5)} | #{get_square_at(6)} ",
      "___|___|___",
      "   |   |   ",
      " #{get_square_at(7)} | #{get_square_at(8)} | #{get_square_at(9)} ",
      "   |   |   "
    ]
  end

  def display
    puts state
  end
end

class Square
  def initialize(mark)
    @mark = mark
  end

  def to_s
    @mark
  end
end

module Displayable
  def message(text)
    puts ">> #{text}"
  end

  def banner(text)
    width = text.size + 4
    edge = '+' + '-' * width + '+'
    blank = '|' + ' ' * width + '|'

    puts edge, blank
    print '|' + text.center(width) + '|'
    puts ''
    puts blank, edge
  end

  def welcome_message
    banner('Welcome to TicTacToe!')
  end

  def goodbye_message
    message('Thanks for playing. Goodbye!')
  end

  def results
    # can show the results or the winner
  end
end

class TTTGame
  include Displayable

  attr_accessor :board 

  def initialize
    @human = Player.new
    @computer = Player.new
    @board = Board.new
  end

  def human_moves
    square = nil
    loop do 
      message("Choose a square 1-9:")
      square_num = gets.chomp
      (1..9).include?(square_num) && @board.squares[square_num] == ' '
      message 'Invalid input.'
    end
    update_square_at(square_num, human.mark)
  end
  
  def someone_won?
    # determine who has 3 in a row
  end

  def board_full
    # check if all the spots on the board are full
  end
  
  def play
    welcome_message
    loop do
      display_board
      human_moves
      break if someone_won? || board_full?

      computer_moves
      break if someone_won? || board_full?
    end
    display_result
    goodbye_message
  end
end

game = TTTGame.new
game.play
