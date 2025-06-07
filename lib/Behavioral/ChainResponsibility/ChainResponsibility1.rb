# ! Chain of Responsibility Pattern
#* It is a behavioral design pattern that allows you to pass requests
#* along a chain of handlers.
#*
#* * It is useful when you need to process data in different ways, but you don't
#* * know in advance what type of processing is needed or in what order
#* * but you know that it needs to be processed in a sequence.
#*
#* https://refactoring.guru/design-patterns/chain-of-responsibility


module Handler
  def set_next(handler)
    raise NotImplementedError
  end

  def handle(request)
    raise NotImplementedError
  end
end


class BaseHandler
  include Handler

  def initialize
    @next_handler = nil
  end

  def set_next(handler)
    @next_handler = handler
    handler
  end

  def handle(request)
    @next_handler&.handle(request)
  end
end


class BasicSupport < BaseHandler
  def handle(request)
    if request == "basic"
      puts "Basic support handled the request"
    else
      puts "Basic support can not handle the request"
      super
    end
  end
end


class AdvancedSupport < BaseHandler
  def handle(request)
    if request == "Advanced"
      puts "Advanced support handled the request"
    else
      puts "Advanced support can not handle the request"
      super
    end
  end
end


class ExpertSupport < BaseHandler
  def handle(request)
    if request == "Expert"
      puts "Expert support handled the request"
    else
      puts "Expert support can not handle the request"
      super
    end
  end
end

class ChainResponsibility1
  def self.main
    basic = BasicSupport.new
    advanced = AdvancedSupport.new
    expert = ExpertSupport.new

    basic.set_next(advanced).set_next(expert)

    basic.handle("Expert")
    # basic.handle("basic")
    # basic.handle("Advanced")
    # basic.handle("random")
  end
end 



