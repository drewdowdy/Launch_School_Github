=begin

Feedback:

[done] 1. Name shouldn't be a string of spaces
[done] 2. Display the total of player's/dealer's hand
[done] 3. Dealer busted then 'chose to stay'
       4. Consider a `Player` superclass and `Human` and `Dealer` subclasses
       5. Round of games with scoreboard
[done] 6. Place messages in a YML file
       7. `Game` class is too big
         - one to orchestrate
         - one for specific rounds
       8. Consider using `private` for method access control

=end

require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('Launch_School_Github/rb120/lesson_5/2_oo_twenty_one/3_oo_21.yml')

module Messageable
  def message(*text)
    text.each do |line| 
      if is_yml?(line)
        puts ">> #{MESSAGES[line]}"
      else 
        puts ">> #{line}"
      end
    end
  end

  def banner(text)
    if is_yml?(text)
      text = MESSAGES[text]
    end

    width = text.size + 4
    edge = "+#{'-' * width}+"
    blank = "|#{' ' * width}|"

    puts edge, blank
    puts "|#{text.center(width)}|"
    puts blank, edge
  end

  def confirm?(question, pos_choice, neg_choice)
    answer = nil
    question = MESSAGES[question] if is_yml?(question)
    formatted_question = "#{question} (#{pos_choice}/#{neg_choice})"
    loop do
      message(formatted_question)
      answer = gets.chomp.downcase
      break if [pos_choice, neg_choice].include?(answer)
      message('invalid')
    end
    answer == pos_choice
  end

  def is_yml?(text)
    MESSAGES.key?(text)
  end
end

module Displayable
  def clear_screen
    system 'clear'
  end

  def loading(text='')
    text = MESSAGES[text] if is_yml?(text)
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
    banner('goodbye')
  end

  def ready?
    confirm?('ready', 'y', 'n')
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
end

class Player
  attr_accessor :hand, :name

  include Messageable

  def initialize
    @hand = []
    set_name
  end

  def human?
    instance_of?(Player)
  end

  def set_name
    if human?
      answer = nil
      loop do
        message('name')
        answer = gets.chomp
        break unless invalid_name?(answer)
        message('invalid')
      end
      self.name = answer
    else
      self.name = ['Wall-E', 'The Terminator', 'Baymax'].sample
    end
  end

  def rows(card)
    top_corner = card.face == '10' ? card.face : "#{card.face} "
    bottom_corner = card.face == '10' ? card.face : "_#{card.face}"
    suit = Card::SUIT_SYMBOLS[card.suit]
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
    hand.map(&:face).each do |face|
      total += Game::SCORES[face]
    end
    if total > 21
      hand.map(&:face).count('A').times do
        total -= 10
      end
    end
    total
  end

  private

  def invalid_name?(name)
    name.strip.empty?
  end
end

class Dealer < Player
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
    hand[1..-1].map(&:face).each do |face|
      total += Game::SCORES[face]
    end
    if total > 21
      hand.map(&:face).count('A').times do
        total -= 10
      end
    end
    total
  end
end

class Deck
  attr_accessor :cards

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
  attr_reader :face, :suit

  FACES = %w(2 3 4 5 6 7 8 9 10 A J Q K)
  SUITS = %w(D C H S)

  SUIT_SYMBOLS = {
    'D' => '♦',
    'C' => '♣',
    'H' => '♥',
    'S' => '♠'
  }

  def initialize(face, suit)
    @face = face
    @suit = suit
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
    return unless participant.instance_of?(Player)
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

class Game
  attr_accessor :player, :dealer, :deck

  SCORES = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
    '7' => 7, '8' => 8, '9' => 9, '10' => 10,
    'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11
  }
  WINNING_TOTAL = 21

  @@reveal_dealer = false

  include Messageable, Displayable, Moveable

  def initialize
    clear_screen
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_cards(num, *participants)
    card = num == 1 ? 'card' : 'cards'
    people = participants.map(&:name)
    loading("Dealing out #{num} #{card} to #{people.join(' and ')}")
    num.times do
      participants.each { |participant| participant.hand << deck.cards.pop }
    end
  end

  def show_cards
    clear_screen
    message("#{player.name}'s Hand")
    player.show_hand
    message("Total: #{player.total}")
    puts ''
    message("#{dealer.name}'s Hand")

    if @@reveal_dealer
      dealer.show_hand(reveal_dealer: true)
      message("#{dealer.name}'s Total: #{dealer.total}")
    else
      dealer.show_hand
      message("#{dealer.name}'s Total: #{dealer.concealed_total}")
    end
    puts ''
  end

  def player_turn
    move = nil
    loop do
      message('Hit or stay?(h/s)')
      move = gets.chomp.downcase
      break if %w(h s).include?(move)
      message('invalid')
    end

    case move
    when 'h' then hit(player)
    when 's' then stay(player)
    end
  end

  def dealer_turn
    until dealer.total >= 17
      loading("#{dealer.name} chose to hit")
      hit(dealer)
    end
    stay(dealer)
  end

  def determine_winner
    dealer_diff = (WINNING_TOTAL - dealer.total).abs
    player_diff = (WINNING_TOTAL - player.total).abs
    differences = [dealer_diff, player_diff]
    case differences.min
    when player_diff
      [player, dealer]
    when dealer_diff
      [dealer, player]
    end
  end

  def winner_and_loser
    if busted?(player) && !busted?(dealer)
      [dealer, player]
    elsif busted?(dealer) && !busted?(player)
      [player, dealer]
    elsif busted?(player) && busted?(dealer)
      []
    else
      determine_winner
    end
  end

  def tie?
    if !busted?(player) && !busted?(dealer)
      player.total == dealer.total
    else
      false
    end
  end

  def show_result
    @@reveal_dealer = true
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
      message("#{loser.name} is the loser with #{loser.total}.")
    end
  end

  def reset_game
    loading('shuffling')
    self.deck = Deck.new
    player.hand = []
    dealer.hand = []
    @@reveal_dealer = false
  end

  def main_game
    loop do
      deal_cards(2, player, dealer)
      show_cards
      player_turn
      dealer_turn
      show_result
      return unless play_again?
      reset_game
    end
  end

  def play_again?
    confirm?('Play again?', 'y', 'n')
  end

  def start
    welcome_message
    display_rules
    main_game
    goodbye_message
  end
end

Game.new.start
