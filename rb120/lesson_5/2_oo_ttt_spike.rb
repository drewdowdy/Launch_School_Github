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
    update_square_at(square_num, human.move)
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

# TTTGame.new.welcome_message
Board.new.display
