function Anagram(word) {
  this.word = word;
}

Anagram.prototype.sortedChars = function sortedChars(word) {
  return word.toLowerCase().split('').sort();
}

Anagram.prototype.matches = function matches() {
  var list;

  if (typeof arguments[0] === 'string') {
    list = Array.from(arguments);
  } else {
    list = arguments[0];
  }

  return list.filter((word) => this.isAnagramOf(word));
}

Anagram.prototype.isAnagramOf = function isAnagramOf(word) {
  if (word.length !== this.word.length) { return false; }
  if (word.toLowerCase() === this.word.toLowerCase()) { return false; }

  const chars = this.word.toLowerCase().split('').sort();
  const otherChars = word.toLowerCase().split('').sort();

  let isAna = true;

  chars.forEach(function(char, index) {
    if (chars[index] !== otherChars[index]) {
      isAna = false;
      return;
    }
  })

  return isAna;
}

module.exports = Anagram;
