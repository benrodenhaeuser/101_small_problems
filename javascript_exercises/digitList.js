// Write a function that takes one argument, a positive integer, and returns a list of the digits in the number.

var digitList = function digitList(num) {
  var digitChars = String(num).split('');
  var digits = [];

  for (var i = 0; i < digitChars.length; i++) {
    digits[i] = Number(digitChars[i]);
  }

  console.log(digits);
}

digitList(12345);       // [1, 2, 3, 4, 5]
digitList(7);           // [7]
digitList(375290);      // [3, 7, 5, 2, 9, 0]
digitList(444);         // [4, 4, 4]
