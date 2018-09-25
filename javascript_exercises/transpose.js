// Write a function that transposes a matrix with at least one row and one column.

// Input: two-dimensional array, at least one row, one col (i.e., [[x]] is the smallest matrix to consider).
// Output: transposed matrix (i.e., the columns of the input matrix are the rows of the output matrix).

function transpose(matrix) {
  var column = function column(index) {
    return matrix.map(function (row) {
      return row[index];
    });
  };

  var indices = Object.keys(matrix[0]);
  return indices.map(column);
}


var matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

var newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
