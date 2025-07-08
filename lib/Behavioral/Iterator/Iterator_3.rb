# ! Iterator Pattern
# This pattern allows you to iterate through the elements of a collection without exposing
# the internal structure of the collection.#
# It's useful when you need to iterate through a collection of elements regardless of
# how the elements are stored.
#
# https://refactoring.guru/design-patterns/iterator
#

class Card
  attr_reader :name, :value

  def initialize(name, value)
    @name = name
    @value = value
  end

  def to_s
    "Card: #{@name}, Value: #{@value}"
  end
end

class CardCollection
  include Enumerable

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def each(&block)
    @cards.each(&block)
  end

  def get_card
    @cards.each
  end
end

class Iterator_3
  def self.main
    deck = CardCollection.new
    deck.add_card(Card.new("Ace of Hearts", 1))
    deck.add_card(Card.new("King of Hearts", 13))
    deck.add_card(Card.new("Queen of Hearts", 12))
    deck.add_card(Card.new("Jack of Hearts", 11))

    puts "Traversing the card collection:"
    deck.each do |card|
      puts card
    end
  end
end

