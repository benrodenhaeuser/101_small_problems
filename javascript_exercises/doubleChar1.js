// Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

var twice = function twice(char) {
  return char + char;
};

var repeater = function repeater(string) {
  var repeated = '';
  var i;

  for (i = 0; i < string.length; i++) {
    repeated += twice(string[i]);
  }

  console.log(repeated);
};

repeater('Hello');        // "HHeelllloo"
repeater('Good job!');    // "GGoooodd  jjoobb!!"
repeater('');             // ""
