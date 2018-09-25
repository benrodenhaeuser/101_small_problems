// find the first fibonacci number that has a given number of digits.
// return its index (i.e., position in the series).

function findFibonacciIndexByLength(length) {
  var fibos = [1, 1];
  var index = 2;

  while (String(fibos[fibos.length - 1]).length < length) {
    fibos[index] = fibos[index - 1] + fibos[index - 2];
    index += 1;
  }

  return index;
}

// without maintaining an array of fibos:

function findFibonacciIndexByLength(length) {
  var first = 1;
  var second = 1;
  var index = 2;
  var fibonacci;

  while (String(second).length < length) {
    var fibonacci = first + second;
    first = second;
    second = fibonacci;
    index += 1;
  }

  return index;
}

findFibonacciIndexByLength(2);       // 7
findFibonacciIndexByLength(10);      // 45
findFibonacciIndexByLength(16);      // 74
