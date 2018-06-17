function Triangle(size) {
  if (size < 1) { throw new Error('invalid size'); }
  this.size = size;
}

Object.defineProperty(Triangle.prototype, 'rows', {
  get: function getRows() {
    var tri = [[1]];
    var i;
    var j;

    for (i = 1; i < this.size; i += 1) {
      tri[i] = [];
      tri[i][0] = 1;
      tri[i][i] = 1;

      for (j = 1; j < i; j += 1) {
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

triangle = new Triangle(0);
