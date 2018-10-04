var alphabet = 'abcdefghijklmnopqrstuvwxyz';

function index(char) {
  return alphabet.indexOf(char);
}

function isLetter(char) {
  return index(char.toLowerCase()) !== -1;
}

function letterAt(index) {
  return alphabet[index];
}

function isLowercaseLetter(char) {
  return index(char) !== -1;
}

function cesar(letter, key) {
  function shift(lowerCaseLetter) {
    return letterAt((index(lowerCaseLetter) + key) % alphabet.length);
  }

  if (isLowercaseLetter(letter)) {
    return shift(letter);
  } else {
    return shift(letter.toLowerCase()).toUpperCase();
  }
}

function vigerene(plaintext, keyword) {
  function shiftKeys(plaintext, keyword) {
    var onlyLetters = plaintext.match(/[A-Z]/gi).join('');
    var sequence = keyword.toLowerCase().split('').map(index);

    while (sequence.length < onlyLetters.length) {
      sequence = sequence.concat(sequence);
    }

    return sequence;
  }

  var keys = shiftKeys(plaintext, keyword);
  var currentIndex = 0;
  var ciphertext = '';
  var currentChar;

  for (var i = 0; i < plaintext.length; i += 1) {
    currentChar = plaintext[i];

    if (isLetter(currentChar)) {
      ciphertext += cesar(currentChar, keys[currentIndex]);
      currentIndex += 1;
    } else {
      ciphertext += currentChar;
    }
  }

  return ciphertext;
}

console.log(vigerene("What's up?", 'abc') === "Wict't wp?");
console.log(vigerene("Pineapples don't go on pizzas!", 'meat') === "Bmnxmtpeqw dhz'x gh ar pbldal!");

/*

The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:

plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!

Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').


PROBLEM:
- Input:  plaintext (arbitrary string), kewyord (upper/lowercase letters)
- Output: ciphertext

Requirements:
- Like the cesar cipher, the vigerene cipher works by shifting every letter of the plaintext using a key.
- Unlike the cesar cipher, the key is drawn anew for every letter using a keyword.
- every letter in the alphabet is assigned a shift value based on 0-indexing:
  - 'a' => shift value 0
  - 'b' => shift value 1
  - ...
  - 'z' => shift value 25
- The case of the keyword letters does not matter (treat it as lowercase).
- Only alphabetic chars are encrypted (like in Cesar), other chars are left as-is.

example:
- plaintext "What's up?"
- keyword 'abc'

plaintext    What's up?
keyword      abca b ca
shift val    0120 1 20
ciphertext   Wict't wp?

algorithm:

- incrementally build ciphertext
- assume sequence of keys (generated from keyword and length of plaintext)

- iterate over plaintext string given.
  1. if it is a non-alphabetic char, append to ciphertext as-is
  2. if it is an alphabetic char, retrieve currentKey as sequence[index]
     and append cesar(currentChar, currentKey) to ciphertext
  3. increment index

- how to build the sequence:

  - generate sequence of keys (shift values) using the keyword
  - length of the sequence is (at least) length of the message without non-alphabetic chars
  - example:
    - keyword 'abc',
    - length of message 10
    - sequence: abcabcabca => [0,1,2,0,1,2,0,1,2,0]

  - algorithmic:

    - function takes length of message (integer) and keyword (string)
    - output is a sequence (array) of keys (integers)

      - split the (lowercased) keyword into chars,
      - map to alphabet indices (call this array keys)
      - while keys is shorter than the length of the message:
        - keys = keys.concat(keys)
      - return keys

*/
