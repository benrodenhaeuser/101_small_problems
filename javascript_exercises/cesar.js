function caesarEncrypt(plaintext, key) {
  var alphabet = 'abcdefghijklmnopqrstuvwxyz';

  function letterAt(index) {
    return alphabet[index];
  }

  function index(char) {
    return alphabet.indexOf(char);
  }

  function isLetter(char) {
    return index(char.toLowerCase()) !== -1;
  }

  function isLowercaseLetter(char) {
    return index(char) !== -1;
  }

  function shift(lowerCaseLetter) {
    return letterAt((index(lowerCaseLetter) + key) % alphabet.length);
  }

  function encrypt(char) {
    if (isLowercaseLetter(char)) {
      return shift(char);
    } else if (isLetter(char)) {
      return shift(char.toLowerCase()).toUpperCase();
    } else {
      return char;
    }
  }

  return plaintext.split('').map(encrypt).join('');
}

console.log(caesarEncrypt('A', 0) === 'A');
console.log(caesarEncrypt('A', 3) === 'D');
console.log(caesarEncrypt('y', 5) === 'd');
console.log(caesarEncrypt('a', 47) === 'v');
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25) === 'ZABCDEFGHIJKLMNOPQRSTUVWXY');
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5) === 'Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!');
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2) === 'Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?');
