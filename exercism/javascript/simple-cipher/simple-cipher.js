var Cipher = function Cipher(key) {
  if (key && key.match(/[0-9]*/)[0] === key) {
    throw new Error('Bad key');
  }

  if (key && key.toUpperCase() === key) {
    throw new Error('Bad key');
  }

  if (key === '') {
    throw new Error('Bad key');
  }

  this.chars = 'abcdefghijklmnopqrstuvwxyz';
  this.key = key || this.generateRandom();
};

Cipher.prototype.generateRandom = function generateRandom() {
  var lengthOfKey = 100;
  var generated = '';
  var i;

  for (i = 0; i < lengthOfKey; i += 1) {
    generated += this.chars[this.randomIndex()];
  }

  return generated;
}

Cipher.prototype.randomIndex = function randomIndex() {
  return Math.floor(Math.random() * this.chars.length);
}

Cipher.prototype.encode = function encode(plaintext) {
  return this.shift(plaintext, '=>');
};

Cipher.prototype.decode = function decode(plaintext) {
  return this.shift(plaintext, '<=');
};

Cipher.prototype.shift = function shift(text, direction) {
  var shifted = '';
  var sign = (direction === '=>' ? 1 : -1);
  var offset;
  var i;

  for (i = 0; i < text.length; i += 1) {
    offset = sign * this.chars.indexOf(this.key[i % this.key.length]);
    shifted += this.shiftChar(text[i], offset);
  }

  return shifted;
};

Cipher.prototype.shiftChar = function shiftChar(char, offset) {
  var index = this.wrap(this.chars.indexOf(char) + offset);
  return this.chars[index];
};

Cipher.prototype.wrap = function wrap(index) {
  if (index >= 0) { return index % this.chars.length; }
  return this.chars.length + (index % this.chars.length);
};

module.exports = Cipher;
