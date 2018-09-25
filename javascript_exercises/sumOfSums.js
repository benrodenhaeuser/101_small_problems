var sum = function sum(numbers) {
  var plus = function plus(number1, number2) {
    return number1 + number2;
  }

  return numbers.reduce(plus);
}

var sumOfSums = function sumOfSums(numbers) {
  var indices = Object.keys(numbers).map(Number);
  var sums = indices.map(function (index) {
    return sum(numbers.slice(0, index + 1));
    });

  return sum(sums);
}

console.log(sumOfSums([3, 5, 2])); // 21
