class GuessingGame
  def initialize(min, max)
    # created @min and @max
    @min = min
    @max = max
    # simplified correct number selection
    @correct_number = rand(min..max)
    # calculated the number of fair remaining guesses
    @remaining_guesses = Math.log2((min..max).size).to_i + 1
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

  attr_accessor :correct_number, :remaining_guesses, :current_guess, :winner, :min, :max

  def display_remaining_guesses
    puts '', "You have #{remaining_guesses} guesses remaining."
  end

  def get_guess
    loop do
      # tell the user to choose a number in the range
      print "Enter a number between #{min} and #{max}: "
      self.current_guess = gets.chomp.to_i
      # check if the guess is within the range
      break if (min..max).include?(current_guess)
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
    self.correct_number = rand(min..max)
    self.remaining_guesses = @remaining_guesses = Math.log2((min..max).size).to_i + 1 
    self.winner = false
  end
end

game = GuessingGame.new(501, 1500)
game.play