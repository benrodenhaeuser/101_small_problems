function isBlockWord(word) {
  var blocks = {
    b: 'o',
    x: 'k',
    d: 'q',
    c: 'p',
    n: 'a',
    g: 't',
    r: 'e',
    f: 's',
    j: 'w',
    h: 'u',
    v: 'i',
    l: 'y',
    z: 'm'
  }

  for (var key in blocks) {
    blocks[blocks[key]] = key;
  }

  word = word.toLowerCase();

  if (!(word.match(/[a-z]*/)[0] === word)) {
    return false;
  }

  var used = [];

  for (var i = 0; i < word.length; i += 1) {
    if (used[word[i]]) { return false; }
    used[word[i]] = true;
    used[blocks[word[i]]] = true;
  }

  return true;
}

console.log(isBlockWord('BATCH'));
console.log(isBlockWord('BUTCH'));
console.log(isBlockWord('jest'));
console.log(isBlockWord('a.'));
