// Given a string that consists of some words and an assortment of non-alphabetic characters, write a function that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (i.e., the result string should never have consecutive spaces).

var isLetter = function isLetter(char) {
  return char.match(/[A-Za-z]/);
}

var cleanUp = function cleanUp(string) {
  var cleaned = '';

  for (i = 0; i < string.length; i++) {
    if (isLetter(string[i])) {
      cleaned += string[i];
    } else if (cleaned[cleaned.length - 1] !== '_') {
      cleaned += '_';
    }
  }

  console.log(cleaned);
}

cleanUp("---what's my +*& line?");    // " what s my line "
