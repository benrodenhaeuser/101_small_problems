function Age(seconds) {
  var secondsPerMinute = 60;
  var minutesPerHour = 60;
  var hoursPerDay = 24;
  var daysPerEarthYear = 365.25;

  this.seconds = seconds;
  this.secondsPerEarthYear =
    secondsPerMinute * minutesPerHour * hoursPerDay * daysPerEarthYear;

  this.earthAge = this.seconds / this.secondsPerEarthYear;

  this.period = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  };
}

Age.prototype.on = function on(location) {
  return Number((this.earthAge * (1 / this.period[location])).toFixed(2));
};

Age.prototype.onEarth = function onEarth() {
  return this.on('earth');
};

Age.prototype.onMercury = function onEarth() {
  return this.on('mercury');
};

Age.prototype.onVenus = function onEarth() {
  return this.on('venus');
};

Age.prototype.onMars = function onEarth() {
  return this.on('mars');
};

Age.prototype.onJupiter = function onEarth() {
  return this.on('jupiter');
};

Age.prototype.onSaturn = function onEarth() {
  return this.on('saturn');
};

Age.prototype.onUranus = function onEarth() {
  return this.on('uranus');
};

Age.prototype.onNeptune = function onEarth() {
  return this.on('neptune');
};

module.exports = Age;
