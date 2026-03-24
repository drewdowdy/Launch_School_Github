=begin

1. Write a description of the problem and extract major nouns and verbs.
2. Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
3. Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

spike - exploratory code to play with the problem
CRC - Class Reponsibility Collaborator

1. 

Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.

2. 

Nouns: board, player, square, grid
Verbs: play, mark

=end

class Board
  INITIAL_MARKER = " "
  
  def initialize
  	@squares = {}
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER)}
  end
  
  def get_square_at(key)
		@squares[key]
  end
end

class Square
  attr_accessor :marker
  
  def initialize(marker)
    @marker = marker
  end
  
  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def human_moves
    puts "Choose a square between 1-9: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (1..9).include?(square)
      puts "Sorry, that's not a valid choice."
    end
    
    board.set_square_at(square, human.marker)
  end
  
  def display_board
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end

  def play
    display_welcome_message
    loop do
      display_board
      break
      human_moves
      display_board
      break
      break if someone_won? || board_full?

      computer_moves
      break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end
end

TTTGame.new.play
