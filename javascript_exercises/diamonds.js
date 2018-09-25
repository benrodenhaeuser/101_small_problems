function diamond(n) {
  var times = function times(symbol, k) {
    return Array(k).fill(symbol).join('');
  }

  var line = function line(numberOfDiamonds) {
    var blanks = times(' ', (n - numberOfDiamonds)/2);
    var diamonds = times('*', numberOfDiamonds);
    return blanks + diamonds + '\n';
  }

  var lines = line(n);

  for (var i = n - 2; i > 0; i -= 2) {
    lines = line(i) + lines + line(i);
  }

  return lines;
}

console.log(diamond(11));
