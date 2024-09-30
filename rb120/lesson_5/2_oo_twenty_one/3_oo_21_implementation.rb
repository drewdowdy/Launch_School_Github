=begin

Move
  - methods related to game
    - hit
    - stay
  - mix in with Game
Player
  - has a hand
  - has a name?
  - state of busted or not
  - both cards are visible
Dealer < Player
  - only 1 card is visible
Deck
  - has cards
  - cards can be removed
Card
  - has a suit and a number
Game
  - starts game
  - has a deck
  - has a player and a dealer
  - deals cards to player and dealer

=end

require 'pry'

module Messageable
  def message(*text)
    text.each { |line| puts ">> #{line}" }
  end

  def banner(text)
    width = text.size + 4
    edge = "+#{'-' * width}+"
    blank = "|#{' ' * width}|"

    puts edge, blank
    puts "|#{text.center(width)}|"
    puts blank, edge
  end

  def confirm?(question, pos_choice, neg_choice)
    answer = nil
    formatted_question = "#{question}(#{pos_choice}/#{neg_choice})"
    loop do
      message(formatted_question)
      answer = gets.chomp.downcase
      break if [pos_choice, neg_choice].include?(answer)
      message(Game::INVALID_INPUT)
    end
    answer == pos_choice
  end
end

module Displayable
  def clear_screen
    system 'clear'
  end

  def loading(text='')
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
    banner('Welcome to Twenty-One!')
  end

  def goodbye_message
    loading
    clear_screen
    banner('Thanks for playing Twenty-One. Goodbye!')
  end

  def rules_array
    [
      'Objective: Get as close to 21 as possible with the total of your hand.',
      'Points: Cards add to your total.',
      '   Jack, Queen, and King are worth 10 points.',
      '   Ace is worth 1 or 11 points.',
      '',
      'Your turn: You can "hit" or "stay".',
      'Dealer\'s turn: The dealer can also "hit" or "stay".',
      '',
      'Hit: Take 1 card from the dealer. Can hit as many times as you want.',
      'Stay: Take no more cards, and your turn ends.',
      '',
      'Bust: If your total goes over 21, you automatically lose.',
      'Tie: If both players have the same total, it\'s a tie.'
    ]
  end

  def ready?
    confirm?('Are you ready to play?', 'y', 'n')
  end

  def display_rules
    return unless confirm?('Do you want to check the rules?', 'y', 'n')
    loop do
      clear_screen
      banner('Rules of Twenty-One')
      rules_array.each { |line| message(line) }
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
        message('Type your name:')
        answer = gets.chomp
        break unless answer.empty?
        puts Game::INVALID_INPUT
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
          [
            " _______ ",
            "|??     |",
            "|       |",
            "|   ??  |",
            "|       |",
            "|_____??|",
            ''
          ]
        else
          rows(card)
        end
      (0..5).each do |i|
        rows[i] += card_rows[i]
      end
    end

    rows.each { |row| puts row }
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
    confirm?('Hit or stay?', 'h', 's') ? hit(participant) : stay(participant)
  end

  def stay(participant)
    loading("#{participant.name} chose to stay")
  end

  def busted?(participant)
    participant.total > 21
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  INVALID_INPUT = "Invalid input."
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
    puts ''
    message("#{dealer.name}'s Hand")

    if @@reveal_dealer
      dealer.show_hand(reveal_dealer: true)
    else
      dealer.show_hand
    end
    puts ''
  end

  def player_turn
    move = nil
    loop do
      message('Hit or stay?(h/s)')
      move = gets.chomp.downcase
      break if %w(h s).include?(move)
      puts Game::INVALID_INPUT
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
    loading('Processing results')
    show_cards
    if tie?
      message("It's a tie!! Everyone has the same total.")
    elsif winner_and_loser.empty?
      message('Everyone busted. No one won..')
    else
      winner = winner_and_loser.first
      loser = winner_and_loser.last
      message("#{winner.name} is the winner with #{winner.total}.")
      message("#{loser.name} is the loser with #{loser.total}.")
    end
  end

  def reset_game
    loading('Shuffling deck')
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
