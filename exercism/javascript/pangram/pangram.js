function Pangram(sentence) {
  this.alphabet = 'abcdefghijklmnopqrstuvwxyz';
  this.sentence = sentence;
}

Pangram.prototype.isPangram = function isPangram() {
  var usedChars = [];
  var currentChar;
  var i;

  if (!this.sentence) { return false; }

  for (i = 0; i < this.sentence.length; i += 1) {
    currentChar = this.sentence[i].toLowerCase();
    if (currentChar.match(/[a-z]/)) {
      usedChars[this.alphabet.indexOf(currentChar)] = currentChar;
    }
  }

  return usedChars.join('') === this.alphabet;
};

module.exports = Pangram;
