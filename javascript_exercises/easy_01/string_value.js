// Write a function that determines and returns the ASCII string value of a string passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String.prototype.charCodeAt() to determine the ASCII value of a character.)

var asciiValue = function asciiValue(string) {
  var value;
  var i;

  value = 0;

  for (i = 0; i < string.length; i++) {
    value += string.charCodeAt(i);
  }

  return value;
}

console.log(asciiValue('Four score') === 984);         // 984
console.log(asciiValue('Launch School') === 1251);      // 1251
console.log(asciiValue('a') === 97);                  // 97
console.log(asciiValue('') === 0);                   // 0
