=begin

Move
  - methods related to game
    - hit
    - stay
  - mix in with Player? 
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
  - deals cards
Card
  - has a suit and a number
Game
  - starts game
  - has a deck
  - has a player and a dealer
  - deals cards to player and 'dealer'

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
    loop do
      message(question)
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

  def rules_array
    [
      'Objective: The total of your hand should be as close to 21 as possible.',
      'Points: The number of each card adds to your total.',
      '        Jack, Queen, and King are 10 points.',
      '        Ace is 1 or 11 points.',
      '',
      'Your turn: Can \'hit\' or \'stay\'.',
      'AI\'s Turn: Also can \'hit\' or \'stay\'.',
      '',
      'Hit:  Get 1 card from the dealer. Any player can hit as many times as they like.',
      'Stay: Get zero cards. The current player\'s turn ends.',
      '',
      'Bust: When a player\'s total goes over 21. That player automatically loses.',
      'Tie:  If both players have the same total in their hands.'
    ]
  end

  def ready?
    confirm?('Are you ready to play?(y/n)', 'y', 'n')
  end

  def display_rules
    return unless confirm?('Do you want to check the rules? (y/n)', 'y', 'n')
    loop do 
      clear_screen
      banner('Rules of Twenty-One')
      rules_array.each { |line| message(line) }
      puts ''
      if ready?
        break
      else
        loading('Take your time')
      end
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
    self.class == Player
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
    suit = Card::SUITS[card.suit][0]
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
    puts ''
  end

  def total
    total = 0
    hand.map(&:face).each do |face|
      total += Game::SCORES[face]
    end
    # minus 10 for every ace IF total is over 21
    total
  end
end

class Dealer < Player
  def show_hand(reveal_dealer: false)
    rows = []
    6.times { rows << '' }
    
    hand.each_with_index do |card, i|
      card_rows = if i == 0 && !reveal_dealer
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

    Card::FACES.keys.each do |face|
      Card::SUITS.keys.each do |suit|
        @cards << Card.new(face, suit)
      end
    end

    @cards.shuffle!
  end
end

class Card
  attr_reader :face, :suit

  FACES = {
    '2'=>'two',
    '3'=>'three',
    '4'=>'four',
    '5'=>'five',
    '6'=>'six',
    '7'=>'seven',
    '8'=>'eight',
    '9'=>'nine',
    '10'=>'ten',
    'A'=>'ace',
    'J'=>'jack',
    'Q'=>'queen',
    'K'=>'king'
  }

  %w(2 3 4 5 6 7 8 9 10 A J Q K)
  %w(D C H S)

  SUITS = {
    'D'=>['♦', 'diamonds'],
    'C'=>['♣', 'clubs'],
    'H'=>['♥', 'hearts'],
    'S'=>['♠', 'spades']
  }

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def to_s
    "#{FACES[face]} of #{SUITS[suit][1]}"
  end
end

module Moveable
  def hit(player)
    deal_cards(1, player)
    show_cards
    if player.class == Player
      confirm?('Hit or stay?(h/s)', 'h', 's') ? hit(player) : stay(player)
    end
  end

  def stay(player)
    loading("#{player.name} chose to stay")
  end

  def busted?(participant)
    participant.total > 21
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  INVALID_INPUT = "Invalid input."
  SCORES = {
    '2'=>2,
    '3'=>3,
    '4'=>4,
    '5'=>5,
    '6'=>6,
    '7'=>7,
    '8'=>8,
    '9'=>9,
    '10'=>10,
    'A'=>11,
    'J'=>10,
    'Q'=>10,
    'K'=>10
  }

  include Messageable, Displayable, Moveable

  def initialize
    clear_screen
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_cards(num, *participants)
    loading('Cards are being dealt')
    num.times do 
      participants.each { |participant| participant.hand << deck.cards.pop }
    end
  end

  def show_cards
    clear_screen
    message("#{player.name}'s Hand")
    player.show_hand
    message("#{dealer.name}'s Hand")
    dealer.show_hand
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

  def show_result
    show_cards(reveal_dealer: true)
  end

  def start
    welcome_message
    display_rules
    deal_cards(2, player, dealer)
    show_cards
    player_turn
    dealer_turn
    # binding.pry
    return
    # show_result
  end
end

Game.new.start
