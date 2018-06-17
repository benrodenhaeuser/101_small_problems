// algorithm:
// create an object that records counts for all chars (including those that are not repeated!)
// create another object that selects only the repeated ones.

var repeatedCharacters = function (word) {
  var counts = {};
  var repeatCounts = {};
  var word = word.toLowerCase();

  for (var i = 0; i < word.length; i += 1) {
    counts[word[i]] = counts[word[i]] || 0;
    counts[word[i]] += 1;
  }

  var keys = Object.keys(counts);

  for (var i = 0; i < keys.length; i += 1) {
    if (counts[keys[i]] > 1) {
      repeatCounts[keys[i]] = counts[keys[i]];
    }
  }

  return repeatCounts;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
