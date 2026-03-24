class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Board
  attr_accessor :squares

  WINNING_LINES =
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], #columns
  [1, 5, 9], [3, 5, 7]             #diagonals

  def initialize
    @squares = {}
    reset
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  #returns boolean 
  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.map(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.map(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  # returns nil or winner's marker
  def detect_winner
    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def state
    [
      '',
      "   |   |   ",
      " #{get_square_at(1)} | #{get_square_at(2)} | #{get_square_at(3)} ",
      "___|___|___",
      "   |   |   ",
      " #{get_square_at(4)} | #{get_square_at(5)} | #{get_square_at(6)} ",
      "___|___|___",
      "   |   |   ",
      " #{get_square_at(7)} | #{get_square_at(8)} | #{get_square_at(9)} ",
      "   |   |   ",
      ''
    ]
  end

  def display
    puts state
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  attr_accessor :marker
  
  INITIAL_MARKER = ' '

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end

  def to_s
    @marker
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

  def display_board(clear=true)
    system 'clear' if clear
    message ("You are #{human.marker}. Computer is #{computer.marker}.")
    board.display
  end

  def display_result
    board.display
    case board.detect_winner
    when human.marker
      banner('You won!!')
    when computer.marker
      banner('Computer won!!')
    else
      message("It's a tie!!")
    end
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  include Displayable

  attr_accessor :board, :human, :computer

  def initialize
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @board = Board.new
  end

  def human_moves
    square_num = nil
    loop do 
      message("Choose a square: (#{board.unmarked_keys.join(', ')})")
      square_num = gets.chomp.to_i
      break if board.unmarked_keys.include?(square_num)
      message 'Invalid input.'
    end
    board.set_square_at(square_num, human.marker)
    system 'clear'
  end

  def computer_moves
    num = board.unmarked_keys.sample
    board.set_square_at(num, computer.marker)
    system 'clear'
  end

  def play_again?
    answer = nil
    loop do 
      message('Play again? (y/n)')
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      message("Invalid input. Type 'y' or 'n'.")
    end
    answer == 'y'
  end
  
  def play
    system 'clear'
    welcome_message

    loop do
      display_board
      loop do
        human_moves
        break if board.full? || board.someone_won?
        
        computer_moves
        display_board
        break if board.full? || board.someone_won?
      end
      display_result
      break unless play_again?
      board.reset
    end

    goodbye_message
  end
end

TTTGame.new.play
