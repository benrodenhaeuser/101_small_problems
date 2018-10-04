// You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.
//
// Your job is to return a list of complete numbers.
//
// The possible separators are: ["-", ":", ".."]
//
// "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
// "1-3, 1-2" --> 1, 2, 3, 11, 12
// "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
// "104-2" --> 104, 105, ... 112
// "545, 64:11" --> 545, 564, 565, .. 611


// PROBLEM
// Input: string
// Output: list of numbers

// Requirements:
// - the input is a comma-separated list of numbers/ranges of numbers
//   (given as string!)
// - ranges are written as 'm..n', 'm:n' or 'm-n' (or mixed)
// - single numbers are written as 'n' (might have leading zeroes)
// - numbers written in shorthand notation
//   - the previous number `prev` serves as a context for expanding the
//     shorthand `short`:
//     ==> increment `prev` up to first number ending in
//         `short` to get the number represented
//  - ranges may consist of more than two numbers: '1:5:3' (1..13)

// Test cases see below

// Data structure: TWO-DIMENSIONAL ARRAY

// Details on data structure: crucial intermediate step:
// List of ranges, where each range is a list of "number strings"
// [[a, b, c], [d], [e, f]]
// each of a, b, c, d, e, f is a string of digits
// (will convert to numbers in the end!)
//
// so essentially we will be working with a nested array, with each "inner
// array" representing a number/range of numbers.

// Algorithm
// 1. convert input string to array as described above (inner arrays contain
// *Strings*)
// 2. resolve all the shorthands to obtain array of pairs of numbers (inner
// array contain *Numbers*)
// 3. expand array to a list of all the numbers in ranges

// three steps correspond to three subproblems:

// subproblem 1
// - split the string along ', '
// - map resulting array to array of lists of numbers (as strings)

// subproblem 2
// - expand number by number from left to right, using previous number as
//   context
// - pick first and last element from each inner array (might be the same
//   number, i.e., [1] becomes [1, 1])

// subproblem 3
// - expand each inner array to a list of numbers
// - concatenate all arrays to one list

// range:
// a strictly ascending sequence of contiguous natural numbers
// canonical way of writing an (inclusive) range:
// specify the lower and upper bound: [m, n]

// range representation with string:
// - 'n' (1 number given)
// - 'm:n', 'm..n', 'm-n' (2 numbers given)
// - 'm:n:k', 'm-n:k' (3 numbers given)
// - 'm:n:k:l' (4 numbers given)

// potentially using SHORTHANDS that need to be expanded:
// => given a previous number, expand current number to smallest number that ends in current number
// => need to work with strings until all numbers expanded!

// connection range - range representation:

// 'n' => ['n'] => [nExp] => [nExp, nExp]
// 'm:n' => ['m', 'n'] => [mExp, nExp] => [mExp, nExp]
// 'm:n:k' => ['m', 'n', 'k'] => [mExp, nExp, kExp] => [mExp, kExp]
// ...

// comma-separated list of ranges:
// the upper bound of previous range provides
// the context for expanding the lower bound of the current range

function extract(rangesString) {
  return rangesString.split(', ').map(function (rangeString) {
    return rangeString.match(/[0-9]+/g);
  });
}

function expandNumber(numberStr, context) {
  var expanded = context;
  var pat = new RegExp(numberStr + '$');

  while (true) {
    if (String(expanded).match(pat)) { return expanded; }
    expanded += 1;
  }
}

function expandRange(range, context) {
  var expanded = range.map(function (number) {
    return context = expandNumber(number, context);
  });

  return [expanded[0], expanded[expanded.length - 1]];
}

function numbers(range) {
  var the_numbers = [];
  for (var i = range[0]; i <= range[1]; i += 1) {
    the_numbers.push(i);
  }
  return the_numbers;
}

function concat(list1, list2) {
  return list1.concat(list2);
}

function getNumbers(string) {
  var context = 0;

  function expand(range) {
    var expanded = expandRange(range, context);
    context = expanded[1];
    return expanded;
  }

  return extract(string)
           .map(expand)
           .map(numbers)
           .reduce(concat, []);
}

console.log(getNumbers("1, 3, 7, 2, 4, 1"));
console.log(getNumbers("1-3, 1-2"));
console.log(getNumbers("1..3, 1..2"));
console.log(getNumbers("1:5:2"));
console.log(getNumbers("104-2"));
console.log(getNumbers("104..02")); // should be 104 ... 202
console.log(getNumbers("545, 64:11"));

// "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
// "1-3, 1-2" --> 1, 2, 3, 11, 12
// "1:5:2" --> 1, 2, 3, 4, 5, 6, ..., 12
// "104-2" --> 104, 105, ..., 112
// "104..02" --> 104, 105, ...202
// "545, 64:11" --> 545, 564, 565, ..., 611
