function Isogram(word) {
  this.word = word.toLowerCase();
}

Isogram.prototype.isIsogram = function isIsogram() {
  const chars = this.word.match(/[a-zA-Z\u00C0-\u017F]/g);
  const cb = (acc, char) => {
    if (acc === false) { return false; }

    if (chars.indexOf(char) !== chars.lastIndexOf(char)) {
      return false;
    } else {
      return true;
    }
  };

  return chars.reduce(cb);
}

module.exports = Isogram;
