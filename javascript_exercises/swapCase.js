// Write a function that takes a string as an argument, and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.

// -- split the word into an array of chars.
// -- map the array to a new array with letters swapped using helper function swap
// -- join the transformed array to a new string.
//
// -- helper function swap:
//    - if the char given is lower case, make it upper case
//    - else make it lower case (with no effect on non-letters)


function swapCase(word) {
  function swap(char) {
    return (char.match(/[a-z]/) ? char.toUpperCase() : char.toLowerCase());
  }

  return word.split('').map(swap).join('');
}

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"
