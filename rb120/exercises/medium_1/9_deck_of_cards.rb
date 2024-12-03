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
    generate_cards
  end
  
  def draw
    generate_cards if cards.empty?
    cards.pop
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
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
