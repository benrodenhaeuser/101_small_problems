// Write a function that takes two array arguments, each containing a list of numbers, and returns a new array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

var multiplyList = function multiplyList(ary1, ary2) {
  var multiples = [];
  var i;

  for (i = 0; i < ary1.length; i++) {
    multiples.push(ary1[i] * ary2[i]);
  }

  console.log(multiples);
}

multiplyList([3, 5, 7], [9, 10, 11]);    // [27, 50, 77]
