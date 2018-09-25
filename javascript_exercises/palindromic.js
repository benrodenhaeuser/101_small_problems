function substringsAtStart(string) {
  return string.split('').map(function (char, idx) {
    return string.slice(0, idx + 1);
  });
}

function substrings(string) {
  return string.split('').reduce(function (acc, char, index) {
    return acc.concat(substringsAtStart(string.slice(index)));
  }, []);
}

function palindromes(word) {
  function isPalindrome(word) {
    if (word.length < 2) { return false; };
    return word === word.split('').reverse().join('');
  }

  return substrings(string).filter(isPalindrome);
}

var string = 'hello-madam-did-madam-goodbye';

console.log(palindromes(string));
// returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]
