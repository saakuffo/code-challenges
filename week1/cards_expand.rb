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
    @@ranks = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
    @@suits = [:spades, :diamonds, :clubs, :hearts]
    @@suits.each do |suit|
      @@ranks.each do |rank|
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
    # print "\nDealing the top card: "
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

class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def checkhand
    total = 0;
    @hand.each do |next_card|
      rank_number = next_card.rank
      if rank_number == 'Ace'
        total += 1
      elsif rank_number == 'Jack' || rank_number == 'Queen' || rank_number == 'King'
        total += 10
      else
        total += rank_number
      end

      
    end

    return total

  end

end

class Blackjack_table

  attr_accessor :deck_in_play, :player, :house

  def initialize(deck)
    @deck_in_play  = deck
    @player = Player.new
    @house = Player.new
  end

  def blkjgame
    game_won = ["", false]

    until game_won[1]
      if @player.checkhand < 21
        puts "What do you want to do?"
        puts "Enter (1) - Hit"
        puts "Enter (2) - Stand"
        puts "Enter (3) - Done"
        player_action = gets.chomp

        if (player_action.to_i != 1) && (player_action.to_i != 2) && (player_action.to_i != 3)
          puts "Please enter a correct value\n"
        elsif player_action.to_i == 1
          puts "You Hit!"
          @player.hand << @deck_in_play.deal
          puts "A #{@player.hand[@player.hand.length - 1].rank} was played!"
          puts "-----"
          puts "You are now at #{@player.checkhand}"
          puts "-----"
        elsif player_action.to_i == 2
          puts "You Stood!"
          puts "-----"
          puts "You are now at #{@player.checkhand}"
          puts "-----"
        elsif player_action.to_i == 3
          puts "You are feeling lucky!"
          game_won = checkgame(@player, @house)
        end
        
      elsif @player.checkhand == 21
        game_won = ["Player", true]
      elsif @player.checkhand > 21
        game_won = ["House", true]
      end

      if @house.checkhand < 17
        @house.hand << @deck_in_play.deal
        if @house.checkhand > 21
          game_won = ["Player", true]
        elsif @house.checkhand == 21 && @player.checkhand != 21
          game_won = ["House", true]
        end

        puts "*****"
        puts "The house is at #{@house.checkhand}"
        puts "*****"
      end

      # game_won = check_winner(@player.hand, @house.hand)
    end

    puts "The House ended up with #{@house.checkhand}"
    puts "The Player ended up with #{@player.checkhand}"
    puts "*****"
    puts "The #{game_won[0]} won the game!"

  end

  def checkgame(player, house)
    until house.checkhand >= 17
      @house.hand << @deck_in_play.deal
    end

    if house.checkhand > 21
      return ["player", true]
    elsif player.checkhand < house.checkhand
      return ["house", true]
    elsif player.checkhand > house.checkhand
      return ["player", true]
    end
  end

end




# puts Deck.random_card_all
# deck = Deck.new
# deck.shuffle
# deck.show_deck
# deck.deal.output_card
# deck.deal.output_card
# deck.deal_random_card.output_card

# deck.show_deck

deck = Deck.new
deck.shuffle.shuffle.shuffle

game = Blackjack_table.new(deck)
game.blkjgame
