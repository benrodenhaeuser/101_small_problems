# class Card
#   # include Comparable
#
#   VALUES = {
#     'Jack' => 11,
#     'Queen' => 12,
#     'King' => 13,
#     'Ace' => 14
#   }
#
#   attr_reader :rank, :suit
#
#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end
#
#   def <=>(other_card)
#     value <=> other_card.value
#   end
#
#   def value
#     VALUES.fetch(@rank, @rank) # neat!
#   end
#
#   def to_s
#     "#{@rank} of #{@suit}"
#   end
# end
#
class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards

  def initialize
    cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    @cards = cards.shuffle
  end

  def draw
    initialize if @cards.empty?
    @cards.pop
  end
end

class Card
  attr_reader :rank, :suit
  # include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(@rank, @rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4 # true
p drawn.count { |card| card.suit == 'Hearts' } == 13 # true
p deck.cards == [] # true
drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # false ?!?
