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

class TextEditor
  def initialize
    @text = ""
    @clipboard = ""
    @history = []
  end

  def type(char)
    @history.push(@text.dup)
    @text += char
  end

  def copy
    @clipboard = @text
    puts "Text copied to clipboard: \"#{@clipboard}\""
  end

  def paste
    @history.push(@text.dup)
    @text += @clipboard
    puts "Text after paste: \"#{@text}\""
  end

  def undo
    if @history.empty?
      puts "Nothing to undo."
    else
      @text = @history.pop
      puts "Text after undo: \"#{@text}\""
    end
  end

  def get_text
    @text
  end
end

class CopyCommand < Command
  def initialize(editor)
    @editor = editor
  end

  def execute
    @editor.copy
  end
end

class PasteCommand < Command
  def initialize(editor)
    @editor = editor
  end

  def execute
    @editor.paste
  end
end

class UndoCommand < Command
  def initialize(editor)
    @editor = editor
  end

  def execute
    @editor.undo
  end
end

class Toolbar
  def initialize
    @commands = {}
  end

  def set_command(button, command)
    @commands[button] = command
  end

  def click_button(button)
    if @commands.key?(button)
      @commands[button].execute
    else
      puts "No command assigned to button \"#{button}\""
    end
  end
end

class Command_2
  def self.main
    editor = TextEditor.new
    toolbar = Toolbar.new

    toolbar.set_command("copy", CopyCommand.new(editor))
    toolbar.set_command("paste", PasteCommand.new(editor))
    toolbar.set_command("undo", UndoCommand.new(editor))

    "Hello word!2".each_char { |c| editor.type(c) }
    puts "Current text: \"#{editor.get_text}\""

    puts "\nCopying text:"
    toolbar.click_button("copy")

    puts "\nPasting text:"
    toolbar.click_button("paste")

    puts "\nUndoing last action:"
    toolbar.click_button("undo")

    puts "\nUndoing again:"
    toolbar.click_button("undo")

    puts "\nFinal text: \"#{editor.get_text}\""
  end
end


