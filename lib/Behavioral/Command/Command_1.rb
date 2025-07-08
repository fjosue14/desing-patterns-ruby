#* ! Command Pattern
#* This pattern encapsulates a request as an object,
#* allowing you to parameterize other objects with different requests,
#* queue requests, or log requests, and supports undoable operations.
#*
#* I really liked Refactoring Guru's explanation
#* https://refactoring.guru/design-patterns/command
#*
#* * It's useful when you need to decouple the object that invokes
#* * the operation from the object that knows how to perform it.
#*
#*


class Command
  def execute
    raise NotImplementedError
  end
end

class Light
  def turn_on
    puts "Light is on"
  end

  def turn_off
    puts "Light is off"
  end
end

class Fan
  def on
    puts "Fan is on"
  end

  def off
    puts "Fan is off"
  end
end

class TurnOnLightCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_on
  end
end

class TurnOffLightCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_off
  end
end

class TurnOnFanCommand < Command
  def initialize(fan)
    @fan = fan
  end

  def execute
    @fan.on
  end
end

class TurnOffFanCommand < Command
  def initialize(fan)
    @fan = fan
  end

  def execute
    @fan.off
  end
end

class RemoteControl
  def initialize
    @commands = {}
  end

  def set_command(button, command)
    @commands[button] = command
  end

  def press_button(button)
    if @commands[button]
      @commands[button].execute
    else
      puts "Button not found"
    end
  end
end

class Command_1
  def self.main
    remote = RemoteControl.new
    light = Light.new
    fan = Fan.new

    remote.set_command("1", TurnOnLightCommand.new(light))
    remote.set_command("2", TurnOffLightCommand.new(light))
    remote.set_command("3", TurnOnFanCommand.new(fan))
    remote.set_command("4", TurnOffFanCommand.new(fan))

    loop do
      puts "\nPress a button:"
      puts "1: Turn on light, 2: Turn off light, 3: Turn on fan, 4: Turn off fan, 5: Exit"
      print "Enter button: "
      button = gets.chomp
      break if button == "5"
      remote.press_button(button)
    end
  end
end

