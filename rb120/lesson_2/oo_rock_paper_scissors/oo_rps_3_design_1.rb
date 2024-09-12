=begin

- Created `Human` and `Computer` subclasses of `Player` class
- Eliminated the need to set and check `player_type` and the `#human?` method
- Reorganized `#set_name` and `#choose` for `Human` and `Computer`

=end

class Player
  attr_reader :move, :name

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

    @name = name
  end

  def choose
    choice = nil
      
    loop do
      puts "- Choose 'rock', 'paper', or 'scissors'"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include?(choice)
      puts '- Invalid input.'
    end
  
    @move = choice
  end
end

class Computer < Player
  def set_name
    @name = ['Computer', 'Bot', 'Wall-E', 'C3P0', 'T-800', 'Ava'].sample
  end

  def choose
    @move = ['rock', 'paper', 'scissors'].sample
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

    case [human.move, computer.move]
    when ['rock', 'scissors'], ['paper', 'rock'], ['scissors', 'paper']
      puts "- #{human.name} is the winner!!"
    when ['rock', 'paper'], ['paper', 'scissors'], ['scissors', 'rock']
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

=begin

is this design, with Human and Computer sub-classes, better? Why, or why not?
what is the primary improvement of this new design?
what is the primary drawback of this new design?

=end