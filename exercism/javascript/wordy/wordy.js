function ArgumentError() {}

function WordProblem(question) {
  this.question = question;
}

WordProblem.prototype.answer = function answer() {
  let operands = this.question.match(/-?[0-9]+/g);
  let operators = this.question.match(/plus|minus|divided by|multiplied by/g);

  if (operands === null || operators === null) {
    throw new ArgumentError();
  }

  operands = operands.map(Number);
  operators.unshift('plus');
  let result = 0;

  while (operands[0]) {
    switch (operators[0]) {
      case 'plus':
        result += operands[0];
        break;
      case 'minus':
        result -= operands[0];
        break;
      case 'divided by':
        result /= operands[0];
        break;
      case 'multiplied by':
        result *= operands[0];
        break;
    }

    operands = operands.slice(1);
    operators = operators.slice(1);
  }

  return result;
};

module.exports = {
  WordProblem,
  ArgumentError
};
