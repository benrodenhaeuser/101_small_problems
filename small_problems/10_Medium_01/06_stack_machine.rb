def minilang(program)
  machine = { stack: [], register: 0 }
  commands = program.split
  commands.each { |command| execute(command, machine) }
end

def execute(command, machine)
  register = machine[:register]
  stack = machine[:stack]

  if command.to_i.to_s == command # command is an integer
    register = command.to_i
  end

  case command
  when 'PUSH'
    stack.push register
  when 'ADD'
    register += stack.pop
  when 'SUB'
    register -= stack.pop
  when 'MULT'
    register *= stack.pop
  when 'DIV'
    register /= stack.pop
  when 'MOD'
    register = register % stack.pop
  when 'POP'
    register = stack.pop
  when 'PRINT'
    puts register
  end

  machine[:stack] = stack
  machine[:register] = register
end

# tests
# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')
