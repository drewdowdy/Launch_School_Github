=begin

include regular and expanded version of RPS
clear the screen
include the title and score
implement a loading 

=end

module Displayable
  def message(text)
    puts "> #{text}"
  end
  
  def banner(text)
    width = text.size

    edge(width)
    puts "| #{text} |"
    edge(width)
  end

  def load_message(msg)
    print "\n", msg

    3.times do
      print '.'
      sleep 0.5
    end

    puts ''
    # system 'clear'
  end

  def edge(width)
    puts "+#{'-' * (width + 2)}+"
  end

  def blank_line(width)
    puts "|#{' ' * (width + 2)}|"
  end
end

class Move
  attr_accessor :value

  include Comparable

  def initialize(value)
    @value = value
  end
end

class Player
  attr_accessor :name, :move

  include Displayable

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    name = nil
    loop do 
      message('Enter the player name:')
      name = gets.chomp
      break unless name.empty?
    end

    self.name = name
    system 'clear'
  end

  def choose
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if !choice.empty?
      message('Invalid input.')
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Computer', 'Wall-E', 'T-800'].sample
  end

  def choose 
    self.move = @version::VALUES.sample
  end
end

class RPSGame
  attr_accessor :human, :computer, :version

  include Displayable

  def initialize
    system 'clear'
    @human = Human.new
    @computer = Computer.new
  end

  def welcome
    system 'clear'
    banner("Welcome to Rock, Paper, Scissors!")
  end

  def goodbye
    banner('Thank you for playing. Goodbye!')
  end

  def rules
    banner('Rules')
    message("#{human.name} and #{computer.name} will take turns choosing a move.")
    puts ''
    
    case self.version
    when 'regular'
      message('Choices are rock, paper, or scissors.')
      puts ''
      lines = [
        'Rock crushes scissors.',
        'Paper covers rock.',
        'Scissors cuts paper.'
      ]
      lines.each { |l| message(l) }
    when 'expanded'
      message('Choices are rock, paper, scissors, lizard, or spock.')
      puts ''
      lines = [
        'Scissors cuts paper.',
        'Paper covers rock.',
        'Rock crushes lizard.',
        'Lizard poisions spock.',
        'Spock smashes scissors.',
        'Scissors decapitates lizard.',
        'Lizard eats paper.',
        'Paper disproves spock.',
        'Spock vaporizes rock.',
        'Rock crushes scissors.'
      ]
      lines.each { |l| message(l) }
    end
    puts ''
    message('The first player to 10 points is the ultimate winner.')
    puts ''
  end

  def scoreboard
    title = "| #{human.name} | #{computer.name} |"
    lcenter = "| #{human.name} |".size
    rcenter = "| #{computer.name} |".size
    width = title.size

    edge(width)
    puts title
    edge(width)
    print "1".center(lcenter), '2'.center(rcenter)
    edge(width)
  end

  def set_version
    version = nil

    loop do 
      message('Do you want to play the regular or expanded version? (r/e)')
      version = gets.chomp.downcase
      break if ['r', 'e'].include?(version)
      message('Invalid input.')
    end

    case version
    when 'r' then @version = 'regular'
    when 'e' then @version = 'expanded'
    end
  end

  def ready?
    answer = nil

    loop do
      message('Are you ready? (y/n)')
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      message('Invalid input.')
    end

    answer == 'y'
  end

  def start
    welcome
    set_version
    rules

    if !ready?
      goodbye
      return
    end

    load_message('Prepping the game')
    system 'clear'

    case self.version
    when 'regular' then RegularGame.new.play
    when 'expanded' then ExpandedGame.new.play
    end
  end
end

class RegularGame < RPSGame
  def initialize; end

  VALUES_HSH = {
    'r'=>'rock',
    'p'=>'paper',
    's'=>'scissors'
  }

  WINNING_VALUES_HSH = {
    'rock'=>['scissors'],
    'paper'=>['rock'],
    'scissors'=>['paper']
  }

  def move_options
    message('Choose one of the following:')
    VALUES_HSH.each do |letter, value|
      message("'#{letter}' for #{value}.")
    end
  end

  def valid_choice?
    VALUES_HSH.keys.include?(@choice)
  end

  def play
    # loop do
      # scoreboard
      move_options

      until valid_choice?
        @human.choose
      end

    #   computer.choose
    #   winner
    #   update_scores
    #   break until play_again?
    # end

  #   history
    goodbye
  end
end

class ExpandedGame < RPSGame
  
  def initialize; end
  
  VALUES = {
    'r'=>'rock',
    'p'=>'paper',
    'sc'=>'scissors',
    'l'=>'lizard',
    'sp'=>'spock'
  }

  WINNING_VALUES = {
    'rock'=>['scissors', 'lizard'],
    'paper'=>['rock', 'spock'],
    'scissors'=>['paper', 'lizard'],
    'lizard'=>['spock', 'paper'],
    'spock'=>['scissors', 'rock']
  }

  def move_options
    message('Choose one of the following:')
    VALUES_HSH.each do |letter, value|
      message("'#{letter}' for #{value}.")
    end
  end

  def valid_choice?
    VALUES_HSH.keys.include?(@choice)
  end

  def play
    # loop do
      # scoreboard
      move_options
      human.choose
    #   computer.choose
    #   winner
    #   update_scores
    #   break until play_again?
    # end

  #   history
    goodbye
  end
end

RPSGame.new.start

=begin

=== CURRENT PROBLEMS ===

- `RegularGame` and `ExpandedGame` don't seem to have access to the `Human` object instantiated from the `RPSGame` class, even though they are both subclasses of `RPSGame`
- What's the best way to display a table?
 

=end
