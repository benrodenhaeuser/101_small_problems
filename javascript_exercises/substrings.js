// Write a function that takes a string argument, and returns a list of all substrings that start from the beginning of the string, ordered from shortest to longest.

function substringsAtStart(string) {
  return string.split('').map(function (char, idx) {
    return string.slice(0, idx + 1);
  });
}
//
// console.log(substringsAtStart('abc'));      // ["a", "ab", "abc"]
// console.log(substringsAtStart('a'));        // ["a"]
// console.log(substringsAtStart('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

// Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given position from shortest to longest.
//
// function substrings(string) {
//   return string.split('').reduce(function (acc, char, index) {
//     return acc.concat(substringsAtStart(string.slice(index)));
//   }, []);
// }

function substrings(string) {
  function subs(i, j) {
    if (i === j) { return [string[i]]; }

    var fullSlice   = [string.slice(i, j + 1)];
    var shrinkRight = subs(i, j - 1);
    var shrinkLeft  = subs(i + 1, j);

    return fullSlice.concat(shrinkRight).concat(shrinkLeft);
  }

  return Array.from(new Set(subs(0, string.length - 1))).sort();
}

console.log(substrings('abcd'));
