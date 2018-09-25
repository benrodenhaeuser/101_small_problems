// Write a function that takes an array of strings, and returns an array of the same strings values without the vowels (a, e, i, o, u).

function removeVowels(list) {
  function deleteVowels(string) {
    return string.replace(/[aeiou]/gi, '');
  }

  return list.map(deleteVowels);
}

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));
