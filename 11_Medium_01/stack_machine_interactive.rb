def run(program, machine)
  commands = program.split
  commands.each do |command|
    execute(command, machine)
    print_state(machine) # log machine state to stdout
  end
end

def print_state(machine)
  puts "[#{machine[:stack]}, #{machine[:register]}]"
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
  return machine
end


# main

machine = { stack: [], register: 0 }

loop do
  print "Waiting for instructions ('q' to quit) ... "
  program = gets.chomp
  break if program == "q"
  run(program,machine)
end
