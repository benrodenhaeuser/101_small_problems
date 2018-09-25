// Write a function that takes a non-empty string argument, and returns the middle character(s) of the string. If the string has an odd length, you should return exactly one character. If the string has an even length, you should return exactly two characters.

var centerOf = function (string) {
  var centerIdx = Math.floor(string.length / 2);

  if (string.length % 2 === 0) {
    return string[centerIdx - 1] + string[centerIdx];
  } else {
    return string[centerIdx];
  }
};

console.log(centerOf('I Love Ruby'));      // "e"
console.log(centerOf('Launch School'));    // " "
console.log(centerOf('Launch'));           // "un"
console.log(centerOf('Launchschool'));     // "hs"
console.log(centerOf('x'));                // "x"
