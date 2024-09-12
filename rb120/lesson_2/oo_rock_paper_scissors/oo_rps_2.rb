=begin

1. implement the `choose` method
2. implement the `display_winner` method
3. play again
4. set player names

=end

class Player
  attr_reader :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    set_name
  end

  def set_name
    name = nil

    if human?
      loop do
        puts "- What is your name?"
        name = gets.chomp
        break unless name.empty?
        puts "- Input can't be empty."
      end

      @name = name
    else
      @name = ['Computer', 'Bot', 'Wall-E', 'C3P0', 'T-800', 'Ava'].sample
    end
  end

  def choose
    if human?
      choice = nil
      
      loop do
        puts "- Choose 'rock', 'paper', or 'scissors'"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts '- Invalid input.'
      end
    
      @move = choice
    else
      @move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "=== Welcome to Rock, Paper Scissors! ==="
  end

  def display_goodbye_message
    puts "=== Thanks for playing. See you next time! ==="
  end

  def display_winner
    puts "- #{human.name} chose #{human.move}."
    puts "- #{computer.name} chose #{computer.move}."

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
