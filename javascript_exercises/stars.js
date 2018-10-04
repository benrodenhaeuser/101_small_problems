function star(n) {
  var half = Math.floor(n / 2);

  function middleLine() {
    return Array(n).fill('*').join('');
  }

  function wrapLine(i) {
    var line = Array(n).fill(' ');
    [half - i, half, half + i].forEach(function (index) {
      line[index] = '*';
    });
    return line.join('');
  }

  var star = middleLine();
  for (var i = 1; i <= half; i += 1) {
    star = wrapLine(i) + '\n' + star + '\n' + wrapLine(i);
  }

  console.log(star);
}

star(7);
console.log('');
star(9);
console.log('');
star(11);

// Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

// input: odd integer >= 7
// output: prints "8-pointed star"

// what is a star of size n? (n the odd integer given)

// - has n lines
// - length of each line is n
// - symmetric along the x-axis
// - middle line consists of n stars
// - all other lines have 3 stars (call those normal lines)
// - every normal line has a star at position floor(n/2)
//

// top line: star at index 0 and index floor(n/2) and index n - 1
// second line: star at index 1 and index floor(n/2) and index n - 2

// lines that wrap the middle line:
// k = Math.floor(n/2)
// [k - 1, k, k + 1]

// lines that wrap those lines:
// [k - 2, k, k + 2]

// continues until we hit the line:

// [k - k, k, k + k]

// star schema:
// [k - k, k, k + k]
// ...
// [k - 1, k, k + 1]
// MIDDLE LINE
// [k - 1, k, k + 1]
// ...
// [k - k, k, k + k]

// DATA STRUCTURE:
// array of strings (consisting of either whitespace or asterisk)

// ALGORITHM

// - initialize star array to just contain middle line (n times '*')
// - k = Math.floor(n/2)
// - for loop: from 1 to k (index i)
//   - unshift wrapLine(i) to array
//   - push wrapLine(i) to array
// - joining stars array with "\n" delimiter
// - log the resulting string

// subproblems:

// function middleLine(n)
// - return a string of length n consisting solely of stars
