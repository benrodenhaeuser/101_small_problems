// Write a function that takes an integer argument, and returns an array containing all integers between 1 and the argument (inclusive), in ascending order.

// You may assume that the argument will always be a positive integer.

var sequence = function (number) {
  var ary = [];
  var i;

  for (i = 1; i <= number; i++) {
    ary.push(i);
  }

  return ary;
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
