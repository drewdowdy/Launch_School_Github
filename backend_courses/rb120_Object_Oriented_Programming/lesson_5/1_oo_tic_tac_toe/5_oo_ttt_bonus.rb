=begin

1. Let player pick any marker
2. Solicit a name for player
3. Give computer name (from several choices)

=end

require 'pry'

module Messageable
  def message(*text)
    text.each { |line| puts ">> #{line}" }
  end

  def banner(text)
    width = text.size + 4
    edge = "+#{'-' * width}+"
    blank = "|#{' ' * width}|"

    puts edge, blank
    puts "|#{text.center(width)}|"
    puts blank, edge
  end
end

class Player
  attr_accessor :marker, :name, :player_type

  include Messageable

  @@available_markers = %w(X O)

  def initialize(player_type=:human)
    @player_type = player_type
    set_name
    set_marker
  end

  def human?
    @player_type == :human
  end

  def set_name
    if human?
      answer = nil
      loop do 
        message("Type the player's name:")
        answer = gets.chomp
        break if !answer.empty?
        puts TTTGame::INVALID_INPUT
      end
      self.name = answer
    else
      self.name = ['Wall-E', 'T-800', 'Baymax'].sample
    end
  end

  def set_marker
    if human?
      answer = nil
      loop do 
        puts ">> Do you want to use #{@@available_markers.join(' or ')}?"
        answer = gets.chomp.upcase
        break if @@available_markers.include?(answer)
        puts TTTGame::INVALID_INPUT
      end
      self.marker = answer
      @@available_markers.delete(@marker)
    else
      self.marker = @@available_markers.pop
    end
  end
end

class Board
  attr_accessor :squares

  WINNING_LINES =
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
    [1, 5, 9], [3, 5, 7]             # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| !@squares[key].marked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers?(squares)
    marks = squares.select(&:marked?).map(&:marker)
    return false if marks.size != 3
    marks.all? { |current_sqr| marks.first == current_sqr }
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  # rubocop:disable Metrics/MethodLength
  def display
    puts [
      '',
      " 1 | 2 | 3 ",
      " #{@squares[1]} | #{@squares[2]} | #{@squares[3]} ",
      "___|___|___",
      " 4 | 5 | 6 ",
      " #{@squares[4]} | #{@squares[5]} | #{@squares[6]} ",
      "___|___|___",
      " 7 | 8 | 9 ",
      " #{@squares[7]} | #{@squares[8]} | #{@squares[9]} ",
      "   |   |   ",
      ''
      ]
  end
  # rubocop:enable Metrics/MethodLength

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

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

module Displayable
  include Messageable

  def welcome_message
    banner('Welcome to TicTacToe!')
  end

  def goodbye_message
    loading
    clear_screen
    banner('Thanks for playing. Goodbye!')
  end

  def display_board
    message("#{human.name} is #{human.marker}. #{computer.name} is #{computer.marker}.")
    board.display
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def winning_message
    case board.winning_marker
    when human.marker
      banner("#{human.name} won!!")
    when computer.marker
      banner("#{computer.name} won!!")
    else
      banner("It's a tie!!")
    end
  end

  def display_result
    loading('Processing results')
    clear_screen
    puts ''
    board.display
    winning_message
  end

  def rules_array
    [
      'Board:       The game is played on a 3x3 board of spaces.',
      'Gameplay:    Players take turns marking empty spaces on the board.',
      'Human:       Marks the board first.',
      'Computer:    Marks the board after the human.',
      'Winner:      Whoever has 3 marks in a row',
      'Conditions:  Horizontally, vertically, or diagonally.',
      'Tie:         The board is full and no player has 3 marks in a row.'
    ]
  end

  def display_rules
    return unless confirm?('Do you want to check the rules? (y/n)')
    loop do 
      clear_screen
      banner('Rules of TicTacToe')
      rules_array.each { |line| message(line) }
      puts ''
      if ready?
        break
      else
        loading('Take your time')
      end
    end
  end

  def ready?
    confirm?('Are you ready to play?(y/n)')
  end

  def clear_screen
    system 'clear'
  end
end

class TTTGame
  INVALID_INPUT = 'Invalid input.'

  include Displayable

  attr_accessor :board, :human, :computer, :current_marker

  def initialize
    clear_screen
    @human = Player.new
    @computer = Player.new(:computer)
    @board = Board.new
    @current_marker = human.marker
  end

  def human_moves
    square_num = nil
    loop do
      message("Choose a square: (#{board.unmarked_keys.join(', ')})")
      square_num = gets.chomp.to_i
      break if board.unmarked_keys.include?(square_num)
      message(INVALID_INPUT)
    end
    board[square_num] = human.marker
  end

  def computer_moves
    loading("#{computer.name} is thinking")
    num = board.unmarked_keys.sample
    board[num] = computer.marker
  end

  def human_turn?
    current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      self.current_marker = computer.marker
    else
      computer_moves
      self.current_marker = human.marker
    end
  end

  def player_move
    loop do
      current_player_moves
      clear_screen_and_display_board
      break if board.full? || board.someone_won?
    end
  end

  def confirm?(question)
    answer = nil
    loop do
      message(question)
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      message(INVALID_INPUT)
    end
    answer == 'y'
  end

  def loading(text='')
    print ">> #{text}"

    3.times do
      sleep 0.5
      print '.'
    end
    sleep 0.5
  end

  def reset_game
    board.reset
    self.current_marker = human.marker
  end

  def set_up_game
    loading('Setting up game')
    clear_screen_and_display_board
  end

  def play_again?
    confirm?('Play again? (y/n)')
  end

  def main_game
    loop do
      set_up_game
      player_move
      display_result
      reset_game
      break unless play_again?
    end
  end

  def play
    clear_screen
    welcome_message
    display_rules
    main_game
    goodbye_message
  end
end

TTTGame.new.play
