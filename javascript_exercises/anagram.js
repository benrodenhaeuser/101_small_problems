function anagram(word, list) {
  function isAnagram(word2) {
    return word.split('').sort().join() === word2.split('').sort().join();
  }

  return list.filter(isAnagram);
}

console.log(anagram('ben', ['ben', 'neb', 'nub'])); // [ 'ben', 'neb' ]
