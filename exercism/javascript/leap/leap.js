var Year = function (year) {
  this.year = year;
};

Year.prototype.isLeap = function () {
  year = this.year;

  return year % 400 === 0 || year % 4 === 0 && year % 100 !== 0;
};

module.exports = Year;
