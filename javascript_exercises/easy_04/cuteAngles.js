// Write a function that takes a floating point number representing an angle between 0 and 360 degrees, and returns a string representing that angle in degrees, minutes, and seconds. You should use a degree symbol (˚) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.

// the value is given in degrees (as a float).
// the angle is between 0 and 360.
// if we multiply by 60 * 60, we get seconds.

var minutesPerDegree = 60;
var secondsPerMinute = 60;
var secondsPerDegree = minutesPerDegree * secondsPerMinute;

var makeString = function makeString(number) {
  if (String(number).length === 2) {
    return String(number);
  } else {
    return "0" + String(number);
  }
}

var dms = function dms(angle) {
  var degrees = Math.floor(angle);
  var normalizedDegrees = Math.floor(angle % 360);
  var remainingSecs = Math.floor((angle - degrees) * secondsPerDegree);

  var minutes = Math.floor(remainingSecs / secondsPerMinute);
  var seconds = remainingSecs - (minutes * secondsPerMinute);

  console.log(String(normalizedDegrees) + "˚" + makeString(minutes) + "'" + makeString(seconds) + '"');
}

dms(30);           // 30°00'00"
dms(76.73);        // 76°43'48"
dms(254.6);        // 254°35'59"
dms(614.6);
dms(93.034773);    // 93°02'05"
dms(0);            // 0°00'00"
dms(360);          // 360°00'00" or 0°00'00"
