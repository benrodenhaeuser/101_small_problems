// Write a function that takes an array of numbers, and returns an array with the same number of elements, with each element's value being the running total from the original array.

var runningTotal = function (numbers) {
  var totals = [];
  var total = 0;

  for (var i = 0; i < numbers.length; i++) {
    total += numbers[i];
    totals.push(total);
  }

  return totals;
};

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []
