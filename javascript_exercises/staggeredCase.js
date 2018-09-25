// Write a function that takes a string as an argument, and returns that string with a staggered capitalization scheme. Every other character, starting from the first, should be capitalized and should be followed by a lowercase or non-alphabetic character. Non-alphabetic characters should not be changed, but should be counted as characters for determining when to switch between upper and lower case.

// Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

function staggeredCase(phrase) {
  var lowerCase = phrase.toLowerCase();
  var isEven = function isEven(index) {
    return index % 2 === 0;
  }

  var upperAtEven = true;

  var staggered = lowerCase.split('').map(function (char, index) {
    if (char.match(/[^A-Za-z]/)) {
      upperAtEven = !upperAtEven;
      return char;
    } else {
      if (upperAtEven) {
        return (isEven(index) ? char.toUpperCase() : char);
      } else {
        return (isEven(index) ? char : char.toUpperCase());
      }
    }
  });

  return staggered.join('');
}

console.log(staggeredCase('I Love Launch School!')); // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS')); // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers')); // "IgNoRe 77 ThE 444 nUmBeRs"
