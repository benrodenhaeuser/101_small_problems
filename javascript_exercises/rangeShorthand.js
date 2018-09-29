function convertToList(rangeString) {
  var pat = new RegExp('[0-9]+((:|-|\\.\\.)[0-9]+)*', 'g')
  var splitString = rangeString.match(pat);
  var listOfRangeStr = splitString.map(function(str) {
    return str.match(/[0-9]+/g);
  });

  return listOfRangeStr.map(function (range) {
    return range.map(Number);
  });
}

function expandRange(range, prev) {
  function expand(number, context) {
    var expanded = context;
    var pat = new RegExp(String(number) + '$');

    while (true) {
      if (String(expanded).match(pat)) { return expanded; }
      expanded += 1;
    }
  }

  var context = (prev === undefined ? 0 : prev[prev.length - 1]);
  var expanded = [];

  range.forEach(function (number) {
    expanded.push(expand(number, context));
    context = expanded[expanded.length - 1];
  });

  return [expanded[0], expanded[expanded.length - 1]];
}

function produceNumbersList(arrayOfRanges) {
  function numbers(range) {
    var the_numbers = [];
    for (var i = range[0]; i <= range[1]; i += 1) {
      the_numbers.push(i);
    }
    return the_numbers;
  }

  return arrayOfRanges.reduce(function (memo, range) {
    return memo.concat(numbers(range));
  }, []);
}

function numbersList(rangeString) {
  var listOfRanges = convertToList(rangeString);
  var expandedListOfRanges = listOfRanges.reduce(function (memo, range) {
    memo.push(expandRange(range, memo[memo.length - 1]));
    return memo;
  }, []);

  return produceNumbersList(expandedListOfRanges);
}

console.log(numbersList("1, 3, 7, 2, 4, 1"));
console.log(numbersList("1-3, 1-2"));
console.log(numbersList("1..3, 1..2"));
console.log(numbersList("1:5:2"));
console.log(numbersList("104-2"));
console.log(numbersList("545, 64:11"));

// "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
// "1-3, 1-2" --> 1, 2, 3, 11, 12
// "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
// "104-2" --> 104, 105, ... 112
// "545, 64:11" --> 545, 564, 565, .. 611
