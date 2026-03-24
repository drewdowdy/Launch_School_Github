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

=== KEEP TRACK OF MOVE HISTORY ===

- sounds like an attribute of the `Human` and `Computer` classes
  - when a new `Move` object is instantiated, add it's value to an array
- the RPSGame class can display the move history at the end for each player
- Maybe a history object can include the move history as well as the round numbers

=== IMPLEMENT COMPUTER PERSONALITIES ===

- change the way the computer chooses
  - 'Computer' chooses randomly
  - 'Wall-E' usually chooses scissors, sometimes chooses paper, but never rock
  - 'T-800' always chooses rock

=end

def message(text)
  puts "> #{text}"
end

def title(text)
  puts "=== #{text} ===".center(80)
end

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
end

class Rock < Move
  def initialize;end

  def >(other_move)
    [Lizard, Scissors].include?(other_move.class)
  end

  def <(other_move)
    [Spock, Paper].include?(other_move.class)
  end
end

class Paper < Move
  def initialize;end

  def >(other_move)
    [Spock, Rock].include?(other_move.class)
  end

  def <(other_move)
    [Lizard, Scissors].include?(other_move.class)
  end
end

class Scissors < Move
  def initialize;end

  def >(other_move)
    [Lizard, Paper].include?(other_move.class)
  end

  def <(other_move)
    [Spock, Rock].include?(other_move.class)
  end
end

class Lizard < Move
  def initialize;end

  def >(other_move)
    [Spock, Paper].include?(other_move.class)
  end

  def <(other_move)
    [Rock, Scissors].include?(other_move.class)
  end
end

class Spock < Move
  def initialize;end

  def >(other_move)
    [Rock, Scissors].include?(other_move.class)
  end

  def <(other_move)
    [Lizard, Paper].include?(other_move.class)
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = Score.new
  end

  def move
    @move.value.class.to_s.downcase
  end
end

class Human < Player
  def set_name
    message("Type the player's name:")
    name = nil

    loop do
      name = gets.chomp
      break unless name.empty?
      message('Please type any name.')
    end

    self.name = name
  end

  def choose
    choice = nil

    loop do
      message("Choose rock, paper, scissors, lizard, or spock:")
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      message("Invalid choice.")
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Computer', 'Wall-E', 'T-800'].sample
  end

  def choose
    case @name
    when 'Computer'
      self.move = Move.new(Move::VALUES.sample)
    when 'Wall-E'
      chance = rand(10)
      self.move = chance < 3 ? Move.new('paper') : Move.new('scissors')
    when 'T-800'
      self.move = Move.new('rock')
    end
  end
end

class History
  attr_accessor :human_moves, :computer_moves

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1_moves = []
    @p2_moves = []
    @round_num = 0
  end

  def update
    @round_num += 1
    @p1_moves << @player1.move
    @p2_moves << @player2.move
  end

  def display
    title = 'Move History'
    lables = " Round | #{@player1.name} | #{@player2.name}"
    lines = []
    
    @round_num.times do |i|
      lines << "#{i + 1}  #{@p1_moves[i]}  #{@p2_moves[i]}"
    end

    width = lines.max_by(&:size).size > lables.size ? lines.max_by(&:size).size : lables.size

    puts title.center(width)
    puts lables.center(width)
    puts "#{'-' * width}"
    lines.each { |line| puts line }
  end
end

module Displayable
  def welcome_message
    title('Welcome to Rock, Paper, Scissors!')
    title('First player to 10 points is the ultimate winner!')
    sleep 0.5
  end

  def goodbye_message
    if computer.score == 10
      sleep 0.5
      title("#{computer.name} is the ultimate winner!!")
    elsif human.score == 10
      sleep 0.5
      title("#{human.name} is the ultimate winner!!")
    end
    sleep 0.5
    title('Thank you for playing Rock, Paper, Scissors!')
  end

  def moves_message
    message("#{human.name} chose #{human.move}.")
    sleep 0.5
    message("#{computer.name} chose #{computer.move}.")
    sleep 0.5
  end

  def winner_message
    if human.move > computer.move
      message("- #{human.name} is the winner!!")
    elsif human.move < computer.move
      message('Computer is the winner!!')
    else
      message("It's a tie!!")
    end
  end

  def scores
    sleep 0.5
    if human.score == 1
      title("#{human.name} has 1 point.")
    else
      title("#{human.name} has #{human.score} points.")
    end
    sleep 0.5
    if computer.score == 1
      title("#{computer.name} has 1 point.")
    else
      title("#{computer.name} has #{computer.score} points.")
    end
  end

  def winning_message
    winning_combos = {
      ['scissors', 'paper'] => 'Scissors cuts paper.',
      ['paper', 'rock'] => 'Paper covers rock.',
      ['rock', 'lizard'] => 'Rock crushes lizard.',
      ['lizard', 'spock'] => 'Lizard poisons Spock.',
      ['spock', 'scissors'] => 'Spock smashes scissors.',
      ['scissors', 'lizard'] => 'Scissors decapitates lizard.',
      ['lizard', 'paper'] => 'Lizard eats paper.',
      ['paper', 'spock'] => 'Paper disproves Spock.',
      ['spock', 'rock'] => 'Spock vaporizes rock.',
      ['rock', 'scissors'] => 'Rock crushes scissors.'
    }

    winning_combos.each do |moves, win_message|
      if human.move == moves[0] && computer.move == moves[1] || computer.move == moves[0] && human.move == moves[1]
        message(win_message)
      end
    end
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :history
  
  include Displayable

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new(@human, @computer)
  end

  def play_again?
    sleep 0.5
    again = nil

    loop do
      message('Do you want to play again? (y/n)')
      again = gets.chomp
      break if ['y', 'n'].include?(again)
      message('Invalid answer. Type y or n.')
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

  def ten_points?
    human.score == 10 || computer.score == 10
  end

  def play
    welcome_message

    loop do
      human.choose
      computer.choose
      history.update
      moves_message
      winning_message
      winner_message
      update_scores
      scores
      break if ten_points?
      break unless play_again?
    end

    history.display
    goodbye_message
  end
end

RPSGame.new.play
