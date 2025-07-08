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
    "Pokemon(name='#{@name}', type='#{@type}')"
  end
end

class PokemonCollection
  def initialize
    @pokemons = []
  end

  def add(pokemon)
    @pokemons << pokemon
  end

  def get_pokemon(index)
    return nil if index < 0 || index >= @pokemons.length
    @pokemons[index]
  end

  def length
    @pokemons.length
  end

  def create_iterator
    PokemonIterator.new(self)
  end
end

class PokemonIterator
  def initialize(collection)
    @collection = collection
    @index = 0
  end

  def next
    if has_next
      pokemon = @collection.get_pokemon(@index)
      @index += 1
      pokemon
    else
      nil
    end
  end

  def has_next
    @index < @collection.length
  end

  def current
    @collection.get_pokemon(@index)
  end
end

class Iterator_1
  def self.main
    pokedex = PokemonCollection.new
    pokedex.add(Pokemon.new('Pikachu', 'Electric'))
    pokedex.add(Pokemon.new('Charmander', 'Fire'))
    pokedex.add(Pokemon.new('Squirtle', 'Water'))

    iterator = pokedex.create_iterator

    while iterator.has_next
      pokemon = iterator.next
      puts pokemon unless pokemon.nil?
    end
  end

end
