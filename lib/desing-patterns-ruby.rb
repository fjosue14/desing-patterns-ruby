require_relative 'Behavioral/ChainResponsibility/ChainResponsibility_1.rb'
require_relative 'Behavioral/ChainResponsibility/ChainResponsibility_2.rb'

require_relative 'Behavioral/Command/Command_1.rb'
require_relative 'Behavioral/Command/Command_2.rb'

require_relative 'Behavioral/Iterator/Iterator_1.rb'
require_relative 'Behavioral/Iterator/Iterator_2.rb'

class DesingPatternsRuby
  def self.run
    puts "¡My app Ruby!"
    #ChainResponsibility1.main
    #ChainResponsibility2.main

    #Command_1.main
    #Command_2.main

    #Iterator_1.main
    Iterator_2.main
  end
end
DesingPatternsRuby.run