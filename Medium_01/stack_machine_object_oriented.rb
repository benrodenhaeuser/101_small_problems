class StackMachine
  def initialize
    @stack = []
    @register = 0
  end

  def run program
    commands = program.split
    commands.each { |command| execute command }
  end

  def execute command
    if command.to_i.to_s == command # command is an integer
      self.write_to_register command.to_i
    elsif self.permitted?(command)
      self.send(command.downcase)
    else
      puts "Warning: ignoring command"
    end
  end

  def permitted?(command)
    if ["PUSH", "ADD", "SUB", "MULT", "DIV", "MOD", "POP", "PRINT"].include? command
      return true
    end
    false
  end

  def write_to_register n
    @register = n
  end

  def push
    @stack.push @register
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register = register % @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def print
    puts @register
  end

end

machine = StackMachine.new

machine.run '3 PUSH 4 PUSH 5 PUSH PRINT PRUNT' # intentional typo: 'PRUNT'
machine.run 'ADD PRINT POP PRINT ADD PRINT'

# 5
# Unknown command
# 10
# 4
# 7
