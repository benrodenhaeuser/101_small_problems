// Write a function that takes one argument, an array containing integers, and returns the average of all the integers in the array, rounded down to the integer component of the average. The array will never be empty, and the numbers will always be positive integers.

var average = function average(list) {
  var theSum = 0;
  var theLength = list.length;

  for (var i = 0; i < list.length; i++) {
    theSum += list[i];
  }

  console.log(Math.floor(theSum / theLength));
};

average([1, 5, 87, 45, 8, 8]);       // 25
average([9, 47, 23, 95, 16, 52]);    // 40
