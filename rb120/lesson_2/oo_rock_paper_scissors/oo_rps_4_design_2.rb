=begin

- Created `Move` class in order to instantiate `Move` objects
- Created `#<` and `#>` methods to compare `Move` objects
- Created custom `#to_s` in `Move` class to expose the value

=end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def >(other_move)
    if rock?
      other_move.scissors?
    elsif paper?
      other_move.rock?
    elsif scissors?
      other_move.paper?
    end
  end

  def <(other_move)
    if rock?
      other_move.paper?
    elsif paper?
      other_move.scissors?
    elsif scissors?
      other_move.rock?
    end
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
    name = nil

    loop do
      puts "- What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "- Input can't be empty."
    end

    self.name = name
  end

  def choose
    choice = nil
      
    loop do
      puts "- Choose 'rock', 'paper', or 'scissors'"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include?(choice)
      puts '- Invalid input.'
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

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "=== Welcome to Rock, Paper Scissors! ==="
    sleep 0.5
  end

  def display_goodbye_message
    sleep 0.5
    puts "=== Thanks for playing. See you next time! ==="
  end

  def display_winner
    puts "- #{human.name} chose #{human.move}."
    sleep 0.5
    puts "- #{computer.name} chose #{computer.move}."
    sleep 0.5

    if human.move > computer.move
      puts "- #{human.name} is the winner!!"
    elsif human.move < computer.move
      puts "- #{computer.name} is the winner!!"
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
      puts '- Invalid input.'
    end

    again == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
