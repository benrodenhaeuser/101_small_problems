// function emptyRailboard(numCols, numRows) {
//   var matrix = Array(numRows).fill('.').map(function (elem) {
//     return [];
//   }).map(function (row) {
//     return '.'.repeat(numCols).split('');
//   });
//
//   var rowIdx = 0;
//   var increment = true;
//
//   for (var i = 0; i < numCols; i += 1) {
//
//     matrix[rowIdx][i] = '?';
//
//     if (increment) {
//       if (rowIdx < numRows - 1) {
//         rowIdx += 1;
//       } else {
//         increment = false;
//         rowIdx -= 1;
//       }
//     } else {
//         if (rowIdx > 0) {
//           rowIdx -= 1;
//         } else {
//           increment = true;
//           rowIdx += 1;
//         }
//     }
//   }
//
//   return matrix;
// }
//
// function insertByRow(matrix, message) {
//   for (var i = 0; i < matrix.length; i += 1) {
//
//     for (var j = 0; j < matrix[i].length; j += 1) {
//
//       if (matrix[i][j] === '?') {
//         matrix[i][j] = message[0];
//         message = message.slice(1);
//       }
//     }
//   }
//
//   return matrix;
// }
//
// function insertByCol(matrix, message) {
//   matrix = transpose(matrix);
//   matrix = insertByRow(matrix, message);
//   return transpose(matrix);
// }
//
//
// function readByRow(matrix) {
//   return matrix.map(function (row) {
//     return row.filter(function (elem) {
//       return elem !== '.';
//     })
//   }).map(function (row) {
//     return row.join('');
//   }).join('');
// }
//
// function transpose(matrix) {
//   function column(index) {
//     return matrix.map(function (row) {
//       return row[index];
//     })
//   }
//
//   var indices = Object.keys(matrix[0]).map(Number);
//   return indices.map(column);
// }
//
// function readByCol(matrix) {
//   matrix = transpose(matrix);
//   return readByRow(matrix);
// }
//
// function encode(message, r) {
//   if (r === 1) { return message; }
//
//   message = message.replace(/ /g, '');
//   var railboard = emptyRailboard(message.length, r);
//   return readByRow(insertByCol(railboard, message));
// }
//
// function decode(message, r) {
//   if (r === 1) { return message; }
//
//   var railboard = emptyRailboard(message.length, r);
//   return readByCol(insertByRow(railboard, message));
// }
//
// console.log(encode('WEAREDISCOVEREDFLEEATONCE', 3) === 'WECRLTEERDSOEEFEAOCAIVDEN');
// console.log(encode('WE ARE DISCOVERED FLEE AT ONCE', 3) === 'WECRLTEERDSOEEFEAOCAIVDEN');
// console.log(encode('TEST', 5) === 'TEST');
// console.log(decode('WECRLTEERDSOEEFEAOCAIVDEN', 3) === 'WEAREDISCOVEREDFLEEATONCE');
// console.log(decode('TEST', 5) === 'TEST');
// console.log(encode('ASSESSMENT', 1) === 'ASSESSMENT');
// console.log(decode('ASSESSMENT', 1) === 'ASSESSMENT');

function encode(message, numberOfRows) {
  var rows = Array(numberOfRows).fill('');
  var seq = sequence(message.length, 0, numberOfRows - 1);
  var seqIndex = 0;

  for (var i = 0; i < message.length; i += 1) {
    currentRowIndex = seq[seqIndex];
    rows[currentRowIndex] += message[i];
    seqIndex += 1;
  }

  return rows.join('');
}

function sequence(length, min, max) {
  var sequence = [min];
  var current = min;
  var increment = true;

  while (sequence.length < length) {
    if (current === min && current === max) { // 1 rail
      sequence.push(current);
    } else {
      if (current === min) {
        increment = true;
      } else if (current === max) {
        increment = false;
      }

      if (increment) {
        current += 1;
      } else {
        current -= 1;
      }

      sequence.push(current);
    }
  }

  return sequence;
}

console.log(encode('WEAREDISCOVEREDFLEEATONCE', 3) === 'WECRLTEERDSOEEFEAOCAIVDEN'); // true

console.log(encode('WEARETHECHAMPIONS', 1) === 'WEARETHECHAMPIONS');

/*
Implement encoding and decoding for the rail fence cipher.

*encode*

We are discovered flee at once

becomes (omit whitespace):

wearediscoveredfleeatonce

(length of message: 25 letters)

becomes (written with three rails):

W...E...C...R...L...T...E
.E.R.D.S.O.E.E.F.E.A.O.C.
..A...I...V...D...E...N..

(length of each rail: 25)

becomes (read off chars line by line):

WECRLTEERDSOEEFEAOCAIVDEN


PROBLEM:

Two parts: encoding and decoding

Part 1: encode

PROBLEM

- input: message in plaintext
- output: message in ciphertext

- message: uppercase or lowercase alphabetic letters and blanks

- "rail-board"
  - dimensions:
    - width: number of rails (fixed upfront, shared between communicating
      parties)
    - length: length of the message

EXAMPLES

- examples:
  - minimum number of rails is one
  - edge case: using one rail is the same as sending plaintext
  - edge case: using more rails than letters is same as sending plaintext

  - encode 'INTERESTINGPROBLEM' with 2 rails

      I.T.R.S.I.G.R.B.E.
      .N.E.E.T.N.P.O.L.M

      => ITRSIGRBENEETNPOLM

DATA STRUCTURE

- obvious idea: m x n matrix (m is rows, n is cols) for railboard
- m is the number of rails (given)
- n is the length of the given message (whitespace eliminated)

ALGORITHM

encode:

1. eliminate whitespace from message input
2. insert plaintext in matrix ("zig-zag": "column by column")
3. read off ciphertext from matrix ("row by row")

decode:

1. insert ciphertext in matrix
2. read off plaintext from matrix

----

(I.) build empty railboard:

empty railboard for 3 rails and 25 chars messag:

? . . . ? . . . ? . . . ? . . . ? . . . ? . . . ?
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .

(II.) inserting a message:

insertByRow(ciphertext) => fill railboard replacing ? with letters row by row
insertByCol(plaintext) => fill railboard replacing ? with letters col by col

express insertByCol in terms of insertByRow

insertByCol(message) => transpose railboard, insertByRow, transpose again

(III.) reading a message:

readByRow() => read the chars row by row
readByCol() => read the chars col by col

express readByCol in terms of readByRow => transpose railboard, readByRow

=> need to implement emptyRailBoard, insertByRow, readByRow, transpose first
=> will define insertByCol and readByCol in terms of these building blocks

*/
