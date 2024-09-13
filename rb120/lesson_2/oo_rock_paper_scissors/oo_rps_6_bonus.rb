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

- Update the values of `VALUES` in the `Move` class
- Update the #> and #< with new logic

=== ADD CLASS FOR EACH MOVE ===

- What information does each class need to have?
  - Each class can determine winners and losers against itself
- Could simplify and remove the #> and #< methods
- Maybe the moves are all subclasses of `Move`

=end

class Score
  attr_accessor :total

  def initialize
    @total = 0
  end

  def +(num)
    @total += num
  end

  def to_s
    @total.to_s
  end
end

class Move
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    set_value(value)
  end

  def set_value(value)
    case value
    when 'rock' then self.value = Rock.new
    when 'paper' then self.value = Paper.new
    when 'scissors' then self.value = Scissors.new
    when 'lizard' then self.value = Lizard.new
    when 'spock' then self.value = Spock.new
    end
  end

  def scissors?
    @value.class == 'Scissors'
  end

  def rock?
    @value.class == 'Rock'
  end

  def paper?
    @value.class == 'Paper'
  end

  def lizard?
    @value.class == 'Lizard'
  end

  def spock?
    @value.class == 'Spock'
  end

  def to_s
    @value.class
  end
end

class Rock < Move
  def initialize;end

  def >(other_move)
    other_move.lizard? || other_move.scissors?
  end

  def <(other_move)
    other_move.spock? || other_move.paper?
  end
end

class Paper < Move
  def initialize;end

  def >(other_move)
    other_move.spock? || other_move.rock?
  end

  def <(other_move)
    other_move.lizard? || other_move.scissors?
  end
end

class Scissors < Move
  def initialize;end

  def >(other_move)
    other_move.lizard? || other_move.paper?
  end

  def <(other_move)
    other_move.spock? || other_move.rock?
  end
end

class Lizard < Move
  def initialize;end

  def >(other_move)
    other_move.spock? || other_move.paper?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end
end

class Spock < Move
  def initialize;end

  def >(other_move)
    other_move.rock? || other_move.scissors?
  end

  def <(other_move)
    other_move.lizard? || other_move.paper?
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = Score.new
  end

  def move
    @move.value.class
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
      puts "- Choose rock, paper, scissors, lizard, or spock:"
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
    puts "=== Welcome to Rock, Paper, Scissors! ===".center(80)
    puts "=== First player to 10 points is the ultimate winner! ===".center(80)
    sleep 0.5
  end

  def display_goodbye_message
    if computer.score == 10
      sleep 0.5
      puts "=== #{computer.name} is the ultimate winner!! ===".center(80)
    elsif human.score == 10
      sleep 0.5
      puts "=== #{human.name} is the ultimate winner!! ===".center(80)
    end
    sleep 0.5
    puts '=== Thank you for playing Rock, Paper, Scissors! ==='.center(80)
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
    else
      human.score += 1
      computer.score += 1
    end
  end

  def display_scores
    sleep 0.5
    if human.score == 1
      puts "=== #{human.name} has 1 point. ===".center(80)
    else
      puts "=== #{human.name} has #{human.score} points. ===".center(80)
    end
    sleep 0.5
    if computer.score == 1
      puts "=== #{computer.name} has 1 point. ===".center(80)
    else
      puts "=== #{computer.name} has #{computer.score} points. ===".center(80)
    end
  end

  def ten_points?
    human.score == 10 || computer.score == 10
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
      break if ten_points?
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
