function RotationalCipher() {
  this.lower = 'abcdefghijklmnopqrstuvwxyz';
  this.upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  this.length = 26;
}

RotationalCipher.prototype.rotateIndex = function rotateIndex(char) {
  return (this.lower.indexOf(char.toLowerCase()) + this.rotation) % this.length;
};

RotationalCipher.prototype.rotate = function rotate(text, rotation) {
  var rot;
  var char;
  var i;

  this.rotation = rotation;
  rot = '';

  for (i = 0; i < text.length; i += 1) {
    char = text[i];
    if (char.match(/[A-Z]/)) {
      rot += this.upper[this.rotateIndex(char)];
    } else if (char.match(/[a-z]/)) {
      rot += this.lower[this.rotateIndex(char)];
    } else {
      rot += char;
    }
  }
  return rot;
};

module.exports = RotationalCipher;
