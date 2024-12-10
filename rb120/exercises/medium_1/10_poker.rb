class Card
  include Comparable
  attr_reader :rank, :suit

  SUIT_RANKING = {
    'Spades'=>4,
    'Hearts'=>3,
    'Clubs'=>2,
    'Diamonds'=>1
  }

  RANKING_ORDER = {
    'Ace'=>13,
    'King'=>12,
    'Queen'=>11,
    'Jack'=>10,
    10=>9,
    9=>8,
    8=>7,
    7=>6,
    6=>5,
    5=>4,
    4=>3,
    3=>2,
    2=>1
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if self.rank == other_card.rank
      SUIT_RANKING[self.suit] <=> SUIT_RANKING[other_card.suit]
    else
      RANKING_ORDER[self.rank] <=> RANKING_ORDER[other_card.rank]
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    take_five_cards
  end
  
  def draw
    generate_cards if cards.empty?
    cards.pop
  end

  def to_s
    cards
  end
  
  private
  
  attr_accessor :cards

  def generate_cards
    @cards = []

    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end

    @cards.shuffle!
  end

  def take_five_cards
    generate_cards
    hand = []
    5.times { hand << cards.shift }
    self.cards = hand
  end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  attr_reader :hand
  
  def initialize(deck)
    @hand = deck.is_a?(Deck) ? deck.to_s : deck
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    flush? && hand.sort.map{ |card| card.rank } == [10] + %w(Jack Queen King Ace)
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    hand.count { |card| hand[0].rank == card.rank } == 4
  end

  def full_house?
    sorted = hand.sort
    count1 = sorted.count { |card| sorted[0].rank == card.rank }
    count2 = sorted.count { |card| sorted[-1].rank == card.rank }
    [count1, count2].sort == [2, 3]
  end

  def flush?
    hand.all? { |card| hand[0].suit == card.suit }
  end

  def straight?
    sorted = hand.sort
    (1...hand.size).all? do |idx|
      current_card_value = Card::RANKING_ORDER[sorted[idx].rank]
      previous_card_value = Card::RANKING_ORDER[sorted[idx - 1].rank]
  
      previous_card_value == current_card_value - 1
    end
  end

  def three_of_a_kind?
    sorted = hand.sort
    (0...hand.size - 2).any? do |idx|
      [sorted[idx].rank, sorted[idx + 1].rank, sorted[idx + 2].rank].all? { |card| card == sorted[idx].rank}
    end
  end

  def two_pair?
    pair_count = 0

    (0...hand.size).each do |idx1|
      ((idx1 + 1)...hand.size).each do |idx2|
        pair_count += 1 if hand[idx1].rank == hand[idx2].rank
      end
    end

    pair_count == 2
  end

  def pair?
    (0...hand.size).each do |idx1|
      ((idx1 + 1)...hand.size).each do |idx2|
        return true if hand[idx1].rank == hand[idx2].rank
      end
    end
    false
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
