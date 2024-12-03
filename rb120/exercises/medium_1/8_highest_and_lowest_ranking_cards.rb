=begin

=== RULES ===

- numeric cards are low (2 to 10)
- jacks are higher than 10s
- queens are higher than jacks
- kings are higher than queens
- aces are higher than kings

=end

class Card
  include Comparable
  
  attr_reader :rank, :suit

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
    RANKING_ORDER[self.rank] <=> RANKING_ORDER[other_card.rank]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
# => 2 of Hearts
# => 10 of Diamonds
# => Ace of Clubs
puts cards.min == Card.new(2, 'Hearts')
# => true
puts cards.max == Card.new('Ace', 'Clubs')
# => true

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
# => true
puts cards.max == Card.new(5, 'Hearts')
# => true

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
# => true
puts cards.max == Card.new(10, 'Clubs')
# => true

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
# => true
puts cards.max.rank == 'Jack'
# => true

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
# => true
puts cards.max.rank == 8
# => true

=begin
## Further Exploration

=== RULES ===

spades > hearts > clubs > diamonds

=end

class NewCard
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

cards = [
  NewCard.new(4, 'Spades'),
  NewCard.new(4, 'Hearts'),
  NewCard.new(4, 'Clubs'),
  NewCard.new(4, 'Diamonds')
]

puts ''
puts cards.min == NewCard.new(4, 'Diamonds')
# => true

cards = [
  NewCard.new(5, 'Diamonds'),
  NewCard.new(4, 'Spades')
]

puts cards.min == NewCard.new(4, 'Spades')
# => true
