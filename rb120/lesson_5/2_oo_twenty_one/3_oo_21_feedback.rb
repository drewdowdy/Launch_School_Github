=begin

Feedback:
[done] 1. Name shouldn't be a string of spaces
[done] 2. Display the total of player's/dealer's hand
[done] 3. Dealer shouldn't bust then 'chose to stay'
[done] 4. Consider a `Player` superclass and `Human` and `Dealer` subclasses
[done] 5. Round of games with scoreboard
[done] 6. Place messages in a YML file
[done] 7. `Game` class is too big
         - one to orchestrate
         - one for specific rounds
       8. Consider using `private` for method access control
[done] 9. Consider using `@value` in `Card` class

=end

require 'pry'
require 'yaml'

MESSAGES = YAML.load_file(
  'Launch_School_Github/rb120/lesson_5/2_oo_twenty_one/3_oo_21.yml'
)

module Messageable
  def message(*texts)
    texts.each do |line|
      if yaml?(line)
        puts ">> #{MESSAGES[line]}"
      else
        puts ">> #{line}"
      end
    end
  end

  def banner(*texts)
    texts.map! { |line| yaml?(line) ? MESSAGES[line] : line }

    width = texts.max.size + 4
    edge = "+#{'-' * width}+"
    blank = "|#{' ' * width}|"

    puts edge, blank
    texts.each { |line| puts "|#{line.center(width)}|" }
    puts blank, edge
  end

  def confirm?(question, pos_choice, neg_choice)
    question = MESSAGES[question] if yaml?(question)
    formatted_question = "#{question} (#{pos_choice}/#{neg_choice})"

    answer = nil
    loop do
      message(formatted_question)
      answer = gets.chomp.downcase
      break if [pos_choice, neg_choice].include?(answer)
      message('invalid')
    end
    answer == pos_choice
  end

  def yaml?(text)
    MESSAGES.key?(text)
  end
end

module Displayable
  def clear_screen
    system 'clear'
  end

  def loading(text='')
    text = MESSAGES[text] if yaml?(text)
    print ">> #{text}"
    2.times do
      sleep 0.5
      print '.'
    end
    sleep 0.5
    puts '.'
  end

  def welcome_message
    clear_screen
    banner('welcome')
  end

  def goodbye_message
    loading
    clear_screen
    show_ultimate_winner if round.ultimate_winner?
    banner('goodbye')
  end

  def ready?
    confirm?('ready', 'y', 'n')
  end

  def play_again?
    confirm?('Play again?', 'y', 'n')
  end

  def display_rules
    return unless confirm?('check_rules', 'y', 'n')
    loop do
      clear_screen
      banner('Rules of Twenty-One')
      MESSAGES['rules'].each { |line| message(line) }
      puts ''
      break if ready?
      loading('Take your time')
    end
  end

  def scoreboard
    banner(
      "Round #{number}",
      "#{human.name}: #{human.score}",
      "#{dealer.name}: #{dealer.score}"
    )
  end

  def show_ultimate_winner
    if human.score == 5
      ultimate_winner = human
    elsif dealer.score == 5
      ultimate_winner = dealer
    end
    banner("#{ultimate_winner.name} is the ultimate winner!")
  end

  def show_cards
    clear_screen
    scoreboard
    message("#{human.name}'s Hand")
    human.show_hand
    message("Total: #{human.total}")
    puts ''
    message("#{dealer.name}'s Hand")

    if @reveal_dealer
      dealer.show_hand(reveal_dealer: true)
      message("Total: #{dealer.total}")
    else
      dealer.show_hand
      message("Partial Total: #{dealer.concealed_total}")
    end
    puts ''
  end

  def show_result
    self.reveal_dealer = true
    loading('processing')
    show_cards
    if tie?
      message('tie')
    elsif winner_and_loser.empty?
      message('everyone_busted')
    else
      winner = winner_and_loser.first
      loser = winner_and_loser.last
      message("#{winner.name} is the winner with #{winner.total}.")
      winner.score += 1
      message("#{loser.name} is the loser with #{loser.total}.")
    end
  end
end

class Player
  attr_accessor :hand, :name, :score

  include Messageable

  def initialize
    @hand = []
    @score = 0
    set_name
  end

  def rows(card)
    top_corner = card.face == '10' ? card.face : "#{card.face} "
    bottom_corner = card.face == '10' ? card.face : "_#{card.face}"
    suit = Card::SYMBOLS[card.suit]
    [
      " _______ ",
      "|#{top_corner}     |",
      "|       |",
      "|   #{suit}   |",
      "|       |",
      "|_____#{bottom_corner}|",
      ''
    ]
  end

  def show_hand
    rows = []
    6.times { rows << '' }

    hand.each do |card|
      (0..5).each do |idx|
        rows[idx] += rows(card)[idx]
      end
    end

    rows.each { |row| puts row }
  end

  def total
    total = 0
    hand.each { |card| total += card.value }
    if total > 21
      hand.map(&:face).count('A').times do
        total -= 10
      end
    end
    total
  end
end

class Human < Player
  def set_name
    answer = nil
    loop do
      message('name')
      answer = gets.chomp
      break unless answer.strip.empty?
      message('invalid')
    end
    self.name = answer
  end
end

class Dealer < Player
  def set_name
    self.name = ['Wall-E', 'The Terminator', 'Baymax'].sample
  end

  def show_hand(reveal_dealer: false)
    if reveal_dealer
      super()
      return
    end

    rows = []
    6.times { rows << '' }

    hand.each_with_index do |card, card_idx|
      card_rows =
        if card_idx == 0
          MESSAGES['mystery_card']
        else
          rows(card)
        end
      (0..5).each do |i|
        rows[i] += card_rows[i]
      end
    end

    rows.each { |row| puts row }
  end

  def concealed_total
    total = 0
    hand[1..-1].each { |card| total += card.value }
    if total > 21
      hand[1..-1].each { |card| total -= 10 if card.face == 'A' }
    end
    total
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []

    Card::FACES.each do |face|
      Card::SUITS.each do |suit|
        @cards << Card.new(face, suit)
      end
    end

    @cards.shuffle!
  end
end

class Card
  attr_reader :face, :suit, :value

  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %w(D C H S)
  SYMBOLS = {
    'D' => '♦',
    'C' => '♣',
    'H' => '♥',
    'S' => '♠'
  }
  VALUES = FACES.zip([2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]).to_h

  def initialize(face, suit)
    @face = face
    @suit = suit
    @value = VALUES[@face]
  end
end

module Moveable
  def hit(participant)
    deal_cards(1, participant)
    show_cards
    if busted?(participant)
      loading("#{participant.name} busted")
      return
    end
    return unless participant.instance_of?(Human)
    confirm?('hit_or_stay', 'h', 's') ? hit(participant) : stay(participant)
  end

  def stay(participant)
    return if busted?(participant)
    loading("#{participant.name} chose to stay")
  end

  def busted?(participant)
    participant.total > 21
  end
end

module Winnable
  WINNING_TOTAL = 21

  def determine_winner
    dealer_diff = (WINNING_TOTAL - dealer.total).abs
    human_diff = (WINNING_TOTAL - human.total).abs
    differences = [dealer_diff, human_diff]
    case differences.min
    when human_diff
      [human, dealer]
    when dealer_diff
      [dealer, human]
    end
  end

  def winner_and_loser
    if busted?(human) && !busted?(dealer)
      [dealer, human]
    elsif busted?(dealer) && !busted?(human)
      [human, dealer]
    elsif busted?(human) && busted?(dealer)
      []
    else
      determine_winner
    end
  end

  def tie?
    if !busted?(human) && !busted?(dealer)
      human.total == dealer.total
    else
      false
    end
  end

  def ultimate_winner?
    human.score == 5 || dealer.score == 5
  end
end

class Round
  attr_accessor :reveal_dealer
  attr_reader :human, :dealer, :deck

  include Messageable, Displayable, Moveable, Winnable

  @@round_number = 0

  def initialize(human, dealer, deck)
    @human = human
    @dealer = dealer
    @deck = deck
    @@round_number += 1
    @reveal_dealer = false
  end

  def deal_cards(num, *participants)
    card = num == 1 ? 'card' : 'cards'
    people = participants.map(&:name)
    loading("Dealing out #{num} #{card} to #{people.join(' and ')}")
    num.times do
      participants.each { |participant| participant.hand << deck.cards.pop }
    end
  end

  def human_turn
    move = nil
    loop do
      message('Hit or stay?(h/s)')
      move = gets.chomp.downcase
      break if %w(h s).include?(move)
      message('invalid')
    end

    case move
    when 'h' then hit(human)
    when 's' then stay(human)
    end
  end

  def dealer_turn
    until dealer.total >= 17
      loading("#{dealer.name} chose to hit")
      hit(dealer)
    end
    stay(dealer)
  end

  def number
    @@round_number
  end

  def play
    deal_cards(2, human, dealer)
    show_cards
    human_turn
    dealer_turn
    show_result
  end

  def reset
    loading('reset')
    human.hand = []
    dealer.hand = []
    self.reveal_dealer = false
  end
end

class Game
  attr_accessor :deck, :round
  attr_reader :human, :dealer

  include Messageable, Displayable

  def initialize
    clear_screen
    @human = Human.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def main_game
    loop do
      self.round = Round.new(human, dealer, deck)
      round.play
      return if round.ultimate_winner?
      return unless play_again?
      round.reset
      self.deck = Deck.new
    end
  end

  def start
    welcome_message
    display_rules
    main_game
    goodbye_message
  end
end

Game.new.start
