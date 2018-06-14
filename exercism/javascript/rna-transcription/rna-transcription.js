function DnaTranscriber() {
  this.converter = {
    G: 'C',
    C: 'G',
    T: 'A',
    A: 'U'
  };
}

DnaTranscriber.prototype.toRna = function toRna(strand) {
  var transcribed = '';
  var i;

  for (i = 0; i < strand.length; i += 1) {
    if (!this.valid(strand[i])) { throw new Error('Invalid input'); }
    transcribed += this.converter[strand[i]];
  }

  return transcribed;
};

DnaTranscriber.prototype.valid = function valid(segment) {
  return this.converter[segment];
};

module.exports = DnaTranscriber;
