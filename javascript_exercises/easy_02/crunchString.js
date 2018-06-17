// Write a function that takes a string argument, and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

var crunch = function crunch(string) {
  if (string === '') { return '' };

  var crunchedString = string[0];
  var previousChar = string[0];

  for (var i = 1; i < string.length; i++) {
    if (string[i] !== previousChar) {
      crunchedString = crunchedString + string[i];
      previousChar = string[i];
    }
  }

  return crunchedString;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""
