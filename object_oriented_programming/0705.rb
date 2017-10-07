class MinilangRuntimeError < RuntimeError; end
class EmptyStack < MinilangRuntimeError; end
class InvalidInput < MinilangRuntimeError; end

class Minilang
  def initialize(program)
    @program = program
    @stack = []
    @register = 0
  end

  def eval
    commands = @program.split
    commands.each { |command| execute command }
    rescue MinilangRuntimeError => error
      puts error.message
  end

  private

  def execute command
    if command.to_i.to_s == command
      write_to_register(command.to_i)
    elsif valid?(command)
      send(command.downcase)
    else
      raise InvalidInput, "Invalid input!"
    end
  end

  def valid? command
    OPERATIONS = ["PUSH", "ADD", "SUB", "MULT", "DIV", "MOD", "POP", "PRINT"]
    OPERATIONS.include? command
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
    @register = @register % @stack.pop
  end

  def pop
    raise EmptyStack, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts @register
  end

end


Minilang.new('PRINT').eval
# 0 FINE

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15 FINE

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5 FINE
# 3 FINE
# 8 FINE

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10 FINE
# 5 FINE

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack! => RUNTIME ERROR fine

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6 FINE

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12 FINE

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB # => RUNTIME ERROR fine

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8 FINE

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
