function SecretHandshake(decimal) {
  if (typeof decimal === 'string') {
    throw new Error('Handshake must be a number');
  }

  this.decimal = decimal;
  this.messages = ['wink', 'double blink', 'close your eyes', 'jump'];
}

SecretHandshake.prototype.commands = function commands() {
  var number = this.decimal;
  var remainder;

  var msgList = [];
  var idx = 0;

  do {
    remainder = number % 2;
    if (remainder === 1) {
      if (idx === 4) {
        msgList.reverse();
      } else {
        msgList.push(this.messages[idx]);
      }
    }
    idx += 1;
    number = Math.floor(number / 2);
  } while (number > 0);

  return msgList;
};

module.exports = SecretHandshake;
