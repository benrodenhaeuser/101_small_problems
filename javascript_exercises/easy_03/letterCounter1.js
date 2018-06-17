// Write a function that takes a string consisting of one or more space separated words, and returns an object that shows the number of words of different sizes.

// Words consist of any sequence of non-space characters.

var wordSizes = function (sentence) {
  var words = sentence.split(' ');
  var counts = {};

  if (sentence === '') return counts;

  var wordSize;

  for (var i = 0; i < words.length; i++) {
    wordSize = words[i].length;
    counts[wordSize] = counts[wordSize] || 0;
    counts[wordSize] += 1;
  }

  return counts;
}


wordSizes('Four score and seven.');
// { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');
// { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");
// { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes(''));
// {}
