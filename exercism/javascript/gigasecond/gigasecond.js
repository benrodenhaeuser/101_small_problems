function Gigasecond(date) {
  this.startingDate = date;
  this.gigaSecond = 1000000000;
}

Gigasecond.prototype.date = function date() {
  var laterDate = new Date(this.startingDate.getTime());
  laterDate.setUTCSeconds(laterDate.getUTCSeconds() + this.gigaSecond)
  return laterDate;
}

module.exports = Gigasecond;
