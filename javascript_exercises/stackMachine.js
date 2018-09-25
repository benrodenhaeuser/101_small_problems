function minilang(input) {
  var stack = []
  var register = 0;
  var commands = input.split(' ');
  var command;

  while (commands.length > 0) {
    command = commands.shift();

    if (command === 'PUSH') {
      stack.push(register);
    } else if (command === 'ADD') {
      register += stack.pop();
    } else if (command === 'SUB') {
      register -= stack.pop();
    } else if (command === 'MULT') {
      register *= stack.pop();
    } else if (command === 'DIV') {
      register = Math.floor(register / stack.pop());
    } else if (command === 'MOD') {
      register = Math.floor(register % stack.pop());
    } else if (command === 'POP') {
      register = stack.pop();
    } else if (command === 'PRINT') {
      console.log(String(register));
    } else {
      register = Number(command);
    }
  }
}

minilang('PRINT');
minilang('5 PUSH 3 MULT PRINT');
minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
minilang('5 PUSH POP PRINT');
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
minilang('3 PUSH PUSH 7 DIV MULT PRINT');
minilang('4 PUSH PUSH 7 MOD MULT PRINT');
minilang('-3 PUSH 5 SUB PRINT');
minilang('6 PUSH');
