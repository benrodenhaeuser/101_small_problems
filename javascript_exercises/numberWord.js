function wordToDigit(sentence) {
  var wordsToDigits = {
    one: '1',
    two: '2',
    three: '3',
    four: '4',
    five: '5',
  }

  Object.keys(wordsToDigits).forEach(function(word) {
    var wordPattern = RegExp(word, 'gi');
    sentence = sentence.replace(wordPattern, wordsToDigits[word]);
  });

  console.log(sentence);
}

wordToDigit('Please call me at five five five one two three four. Thanks.');
// "Please call me at 5 5 5 1 2 3 4. Thanks."
