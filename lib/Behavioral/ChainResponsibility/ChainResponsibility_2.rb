# ! Chain of Responsibility Pattern
#* It is a behavioral design pattern that allows you to pass requests
#* along a chain of handlers.
#*
#* * It is useful when you need to process data in different ways, but you don't
#* * know in advance what type of processing is needed or in what order
#* * but you know that it needs to be processed in a sequence.
#*
#* https://refactoring.guru/design-patterns/chain-of-responsibility

module Approver
  def set_next(handler)
    raise NotImplementedError
  end

  def approve_request(amount)
    raise NotImplementedError
  end
end


class BaseApprover
  include Approver

  def initialize
    @next_handler = nil
  end

  def set_next(handler)
    @next_handler = handler
    handler
  end

  def approve_request(amount)
    if @next_handler
      @next_handler.approve_request(amount)
    else
      puts "Request could not be approved."
    end
  end
end


class Supervisor < BaseApprover
  def approve_request(amount)
    if amount <= 1000
      puts "Application approved by Supervisor"
    else
      super
    end
  end
end


class Manager < BaseApprover
  def approve_request(amount)
    if amount <= 5000
      puts "Request approved by Manager"
    else
      super
    end
  end
end


class Director < BaseApprover
  def approve_request(amount)
    puts "Request approved by Director"
  end
end

class ChainResponsibility2
  def self.main 
    supervisor = Supervisor.new
    manager = Manager.new
    director = Director.new

    supervisor.set_next(manager).set_next(director)

    puts "$500 purchase request:"
    supervisor.approve_request(500)

    puts "\nPurchase request for $3000:"
    supervisor.approve_request(3000)

    puts "\nPurchase request for $7000:"
    supervisor.approve_request(7000)
  end
end


