function Matrix(str) {
  this.rows = str
    .split('\n')
    .map(rowStr => rowStr
      .split(' ')
      .map(Number));

  this.columns = this.transpose();
}

Matrix.prototype.transpose = function transpose() {
  const numberOfColumns = this.rows[0].length;
  const numberOfRows = this.rows.length;
  const columns = [];

  for (let i = 0; i < numberOfColumns; i += 1) {
    const currentColumn = [];

    for (let j = 0; j < numberOfRows; j += 1) {
      currentColumn.push(this.rows[j][i]);
    }

    columns.push(currentColumn);
  }

  return columns;
};

module.exports = Matrix;
