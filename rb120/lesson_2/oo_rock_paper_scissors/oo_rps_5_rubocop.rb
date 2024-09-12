=begin

- Refactored `#<` and `#>` methods in `Move` class
- Refactored `#display_winner` method in `RPSGame` class by created `#display_moves` method

=end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    puts "- Type the player's name:"
    name = nil

    loop do
      name = gets.chomp
      break unless name.empty?
      'Please type any name.'
    end

    self.name = name
  end

  def choose
    choice = nil

    loop do
      puts "- Choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "- Invalid choice."
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Computer', 'Bot', 'Wall-E', 'C3P0', 'T-800', 'Ava'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "=== Welcome to Rock, Paper, Scissors! ==="
    sleep 0.5
  end

  def display_goodbye_message
    sleep 0.5
    puts '=== Thank you for playing Rock, Paper, Scissors! ==='
  end

  def display_moves
    puts "- #{human.name} chose #{human.move}."
    sleep 0.5
    puts "- #{computer.name} chose #{computer.move}."
    sleep 0.5
  end

  def display_winner
    if human.move > computer.move
      puts "- #{human.name} is the winner!!"
    elsif human.move < computer.move
      puts '- Computer is the winner!!'
    else
      puts "- It's a tie!!"
    end
  end

  def play_again?
    sleep 0.5
    again = nil

    loop do
      puts '- Do you want to play again? (y/n)'
      again = gets.chomp
      break if ['y', 'n'].include?(again)
      puts '- Invalid answer. Type y or n.'
    end

    again == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
