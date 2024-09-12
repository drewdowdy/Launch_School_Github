=begin

- Implement a way to keep score
- Add 'lizard' and 'spock'
- Add class for each move
- Keep track of a history of moves
- Implement computer personalities (beyond just names)

=== KEEPING SCORES ===

The first player to 10 points is the ultimate winner.

- Creating `Score` class objects will allow us to more easily implement scores between the human player and the computer player.
- A `Score` class can also contain methods related to updating the score.

- However, it could be more straightforward to creat a instance variable `score` in the `Player` class that can be updated depending on the winner

=== ADD 'Lizard' AND `Spock` ===



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
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
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

  def update_scores
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_scores
    sleep 0.5
    puts "- #{human.name} has #{human.score} points."
    sleep 0.5
    puts "- #{computer.name} has #{computer.score} points."
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      update_scores
      display_scores
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
