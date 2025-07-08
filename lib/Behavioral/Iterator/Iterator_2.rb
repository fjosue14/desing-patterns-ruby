# ! Iterator Pattern
# This pattern allows you to iterate through the elements of a collection without exposing
# the internal structure of the collection.#
# It's useful when you need to iterate through a collection of elements regardless of
# how the elements are stored.
#
# https://refactoring.guru/design-patterns/iterator
#

class Pokemon
  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def to_s
    "Pokemon: #{@name}, Type: #{@type}"
  end
end

class PokemonCollection
  include Enumerable

  def initialize
    @pokemons = []
  end

  def add_pokemon(pokemon)
    @pokemons << pokemon
  end

  def each(&block)
    @pokemons.each(&block)
  end
end

class Iterator_2
  def self.main
    pokedex = PokemonCollection.new
    pokedex.add_pokemon(Pokemon.new('Pikachu', 'Electric'))
    pokedex.add_pokemon(Pokemon.new('Charmander', 'Fire'))
    pokedex.add_pokemon(Pokemon.new('Squirtle', 'Water'))
    pokedex.add_pokemon(Pokemon.new('Bulbasaur', 'Plant'))

    puts "Touring the Pokemon collection:"
    pokedex.each do |pokemon|
      puts pokemon
    end
  end
end


