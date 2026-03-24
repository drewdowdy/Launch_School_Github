VALID_CHOICES = %w(rock paper scissors lizard spock)

def test_method
  prompt('test message')
end

# test_method

def prompt(message)
  puts "=> #{message}"
end

# test_method

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def defeat_message(choice1, choice2)
  if choice1 == 'rock' && choice2 == 'lizard'
    'Rock crushes lizard.'
  elsif choice1 == 'rock' && choice2 == 'scissors'
    'Rock crushes scissors.'
  elsif choice1 == 'paper' && choice2 == 'rock'
    'Paper covers rock.'
  elsif choice1 == 'paper' && choice2 == 'spock'
    'Paper disproves Spock.'
  elsif choice1 == 'scissors' && choice2 == 'paper'
    'Scissors cuts paper.'
  elsif choice1 == 'scissors' && choice2 == 'lizard'
    'Scissors decapitates lizard.'
  elsif choice1 == 'lizard' && choice2 == 'spock'
    'Lizard poisons Spock.'
  elsif choice1 == 'lizard' && choice2 == 'paper'
    'Lizard eats paper.'
  elsif choice1 == 'spock' && choice2 == 'rock'
    'Spock vaporizes rock.'
  elsif choice1 == 'spock' && choice2 == 'scissors'
    'Spock smashes scissors.'
  else
    'Nothing happened..'
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won! 🥳')
  elsif win?(computer, player)
    prompt('Computer won.. 😥')
  else
    prompt("It's a tie! 😐")
  end
end

prompt("First player to 3 is the grand winner!")

human_score = 0
computer_score = 0

loop do #main loop
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt('(r = rock, p = paper, sc = scissors, l = lizard, sp = spock)')
    choice = gets.chomp.downcase

    case choice
    when 'r', 'rock' then choice = 'rock'
    when 'p', 'paper' then choice = 'paper'
    when 'sc', 'scissors' then choice = 'scissors'
    when 'l', 'lizard' then choice = 'lizard'
    when 'sp', 'spock' then choice = 'spock' 
    else prompt("That's not a valid choice.")
    end

    break if VALID_CHOICES.include?(choice)
  end

  sleep(1)

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  sleep(1)

  if win?(choice, computer_choice)
    prompt(defeat_message(choice, computer_choice))
    human_score += 1
  elsif win?(computer_choice, choice)
    prompt(defeat_message(computer_choice, choice))
    computer_score += 1
  end

  display_results(choice, computer_choice)

  sleep(1)

  prompt("Human Score: #{human_score}; Computer Score: #{computer_score}")

  sleep(1)

  break if human_score == 3 || computer_score == 3
end

sleep(0.5)

prompt("CONGRATULATIONS! You're the grand winner!") if human_score == 3
prompt('GAME OVER. Better luck next time..') if computer_score == 3
