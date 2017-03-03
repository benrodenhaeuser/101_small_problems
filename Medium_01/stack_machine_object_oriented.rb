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
    if command.to_i.to_s == command # command is an integer string
      self.write_to_register command.to_i
    elsif self.valid?(command)
      self.send(command.downcase)
    else
      puts "Warning: ignoring command"
    end
  end

  def valid? command
    result = false
    if ["PUSH", "ADD", "SUB", "MULT", "DIV", "MOD", "POP", "PRINT"].include? command
      result = true
    end
    result
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

# test
machine = StackMachine.new
machine.run '3 PUSH 4 PRUNT PUSH 5 PUSH PRINT' # notice the intentional typo: 'PRUNT'
machine.run 'ADD PRINT POP PRINT ADD PRINT'

# =>
# Warning: ignoring command
# 5
# 10
# 4
# 7
