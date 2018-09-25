function isBalanced(expression) {
  var parens = expression.match(/[()]/g);
  var index = 0;
  var balance = 0;
  var cursor;

  while (cursor = parens[index]) {
    if (balance < 0) { return false; }
    cursor === '(' ? balance += 1 : balance -= 1;
    index += 1;
  }

  return balance === 0;
}

console.log(isBalanced('(migh)ty()'));
