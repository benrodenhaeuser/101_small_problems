var centuryNumber = function centuryNumber(year) {
  return Math.ceil(year / 100);
}

var CENTURIES = {
  '0': 'th',
  '1': 'st',
  '2': 'nd',
  '3': 'rd',
  '4': 'th',
  '5': 'th',
  '6': 'th',
  '7': 'th',
  '8': 'th',
  '9': 'th'
}

var centuryEnding = function centuryEnding(centuryString) {
  var lastTwoDigits = centuryString.slice(-2);
  var lastDigit = centuryString.slice(-1);

  if (['11', '12', '13'].includes(lastTwoDigits)) {
    return 'th';
  } else {
    return CENTURIES[lastDigit];
  }
}

var century = function century(year) {
  var number = centuryNumber(year);
  var ending = centuryEnding(String(number));
  return String(number) + ending;
}

console.log(century(2000) === '20th');
console.log(century(2001) === '21st');
console.log(century(1965) === '20th');
console.log(century(256) === '3rd');
console.log(century(5) === '1st');
console.log(century(10103) === '102nd');
console.log(century(1052) === '11th');
console.log(century(1127) === '12th');
console.log(century(11201) === '113th');
