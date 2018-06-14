function Gigasecond(date) {
  this.startingDate = date;
  this.gigaSecond = 1000000000;
}

// does not handle the 1959 tests correctly.

Gigasecond.prototype.date = function date() {
  var laterDate = new Date(this.startingDate.getTime());
  laterDate.setSeconds(laterDate.getSeconds() + this.gigaSecond)
  return laterDate;
}

module.exports = Gigasecond;
