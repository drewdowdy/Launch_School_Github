=begin

=== RULES ===

- numbers in range of 1 to 100
- limit of 7 guesses per game

=end

class GuessingGame
  def initialize
    @correct_number = (1..100).to_a.sample
    @remaining_guesses = 7
    @winner = false
  end

  def play
    loop do 
      display_remaining_guesses
      get_guess
      analyze_guess
      break if remaining_guesses == 0 || winner
    end
    puts "You have no more guesses. You lost!" if !winner
    reset_game
  end

  private

  attr_accessor :correct_number, :remaining_guesses, :current_guess, :winner

  def display_remaining_guesses
    puts '', "You have #{remaining_guesses} guesses remaining."
  end

  def get_guess
    loop do
      print 'Enter a number between 1 and 100: '
      self.current_guess = gets.chomp.to_i
      break if (1..100).include?(current_guess)
      print 'Invalid guess. '
    end
  end

  def too_low?
    current_guess < correct_number
  end

  def too_high?
    current_guess > correct_number
  end

  def analyze_guess
    if too_low?
      puts "Your guess is too low.", ''
      self.remaining_guesses -= 1
    elsif too_high?
      puts "Your guess is too high.", ''
      self.remaining_guesses -= 1
    elsif current_guess == correct_number
      puts "Thats the number!", ''
      puts "You won!"
      self.winner = true
    end
  end

  def reset_game
    self.correct_number = (1..100).to_a.sample
    self.remaining_guesses = 7
    self.winner = false
  end
end

game = GuessingGame.new
game.play

=begin
## Further Exploration

>  Do you think it's a good idea to have a Player class?

I think it would be a good idea to implement a `Player` class if we plan to do some kind of score keeping. That could be stored in the state of any `Player` object. 

> What methods and data should be part of it?

```ruby
class Player
  def initialize
    @name = set_name
    @score = 0
    @remaining_guesses = 7
  end

  def make_guess
    # get the guess input from user
    # could initialize a @current_guess instance variabe
  end

  def increment_score
    # increase score IF guess is correct
  end

  def reduce_remaining_guesses
    # reduce remaining guesses after a guess has been made
  end
  
  private

  def set_name
    # allow player to set name
  end

  def valid_name?
    # vaidate the players name
  end
end
```

> How many Player objects do you need?
  
You could have 1 player guessing on their own. Or you could have a number of players guessing with their own number of chances.

> Should you use inheritance, a mix-in module, or a collaborative object?

For a Player, it would be best to use a collaborator object. That way each 'player' could keep track of their own remaining guesses and current guesses, and scores in the states of their objects.

=end
