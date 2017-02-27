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
      self.register command.to_i
    end

    case command
    when 'PUSH'
      self.push
    when 'ADD'
      self.add
    when 'SUB'
      self.sub
    when 'MULT'
      self.mult
    when 'DIV'
      self.div
    when 'MOD'
      self.mod
    when 'POP'
      self.pop
    when 'PRINT'
      self.print
    end

  end

  def register n
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

machine.run '3 PUSH 4 PUSH 5 PUSH PRINT'
machine.run 'ADD PRINT POP PRINT ADD PRINT'
