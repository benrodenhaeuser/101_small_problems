var TwoFer = function TwoFer() {};

TwoFer.prototype.twoFer = function twoFer(who) {
  var otherPerson = who || 'you';
  return 'One for ' + otherPerson + ', one for me.';
};

module.exports = TwoFer;
