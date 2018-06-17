var consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];

var twice = function twice(char) {
  return char + char;
};

var doubleConsonants = function (string) {
  var repeated = '';
  var i;

  for (i = 0; i < string.length; i++) {
    if (consonants.indexOf(string[i]) >= 0) {
      repeated += twice(string[i]);
    } else {
      repeated += string[i];
    }
  }

  return repeated;
}

doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""
