function Triangle(size) {
  if (size < 1) { throw new Error('invalid size'); }
  this.size = size;
}

Object.defineProperty(Triangle.prototype, 'rows', {
  get: function getRows() {
    const tri = [[1]];

    for (let i = 1; i < this.size; i += 1) {
      tri[i] = Array(i + 1).fill(1);

      for (let j = 1; j < i; j += 1) {
        tri[i][j] = tri[i - 1][j - 1] + tri[i - 1][j];
      }
    }

    return tri;
  }
});

Object.defineProperty(Triangle.prototype, 'lastRow', {
  get: function getLastRow() {
    return this.rows[this.size - 1];
  }
});

module.exports = Triangle;
