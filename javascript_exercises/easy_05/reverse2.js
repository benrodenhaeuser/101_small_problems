// Write a function that takes a string argument containing one or more words, and returns a new string containing the words from the string argument. All five-or-more letter words should have their letters in reverse order. The string argument will consist of only letters and spaces. Words will be separated by a single space.

var reverseWords = function (sentence) {
  var words = sentence.split(' ');
  for (var i = 0; i < words.length; i++) {
    if (words[i].length > 4) {
      words[i] = words[i].split('').reverse().join('');
    }
  }

  return words.join(' ');
};

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"
