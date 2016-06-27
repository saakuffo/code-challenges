class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    @ranks = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
    @suits = [:spades, :diamonds, :clubs, :hearts]
    @suits.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def show_deck
    puts "Here are the #{@cards.length} cards in this deck"
    puts "---------Start of Deck---------"
    @cards.each do |card|
      print card.output_card
    end
    puts "---------End of Deck-----------"
  end

  def deal
    print "\nDealing the top card: "
    return @cards.shift
  end

  # Deal a random card from a instantiated deck
  def deal_random_card
    print "Drawing a random card from a Deck in play....."
    return @cards.delete_at(rand(@cards.length - 1))
  end

  # Draw a random ephemeral card from all possible valid cards
  def self.random_card_all
    print "Drawing a random card...."
    Deck.new.shuffle.first.output_card
  end
end

puts Deck.random_card_all
deck = Deck.new
deck.shuffle
deck.show_deck
deck.deal.output_card
deck.deal.output_card
deck.deal_random_card.output_card

deck.show_deck




