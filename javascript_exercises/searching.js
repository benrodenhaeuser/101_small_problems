var promptStatement = function promptStatement(number) {
  var suffix = {
    1: 'st',
    2: 'nd',
    3: 'rd',
    4: 'th',
    5: 'th'
  };

  var round = String(number) + suffix[number];

  return "Enter the " + round + "number: ";
}

var displayArray = function displayArray(array) {
  arrayStr = array.join(', ');
  return "[" + arrayStr + ']';
}

var promptAndSearch = function promptAndSearch() {
  var fiveNumbers = [];

  for (var i = 1; i <= 5; i++) {
    fiveNumbers.push(prompt(promptStatement(i)));
  }

  var lastNumber = prompt("Enter the last number: ");

  if (fiveNumbers.includes(lastNumber)) {
    alert("The number " + lastNumber + " appears in " + displayArray(fiveNumbers));
  } else {
    alert("The number " + lastNumber + " does not appear in " + displayArray(fiveNumbers));
  }
}
