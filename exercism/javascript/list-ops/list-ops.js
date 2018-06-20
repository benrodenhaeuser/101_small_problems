function List(values) {
  this.values = values || [];
}

List.prototype.length = function length() {
  return this.values.length;
};

List.prototype.push = function push(value) {
  this.values.push(value);
  return this;
};

List.prototype.append = function append(other) {
  for (let i = 0; i < other.values.length; i += 1) {
    this.push(other.values[i]);
  }
  return this;
};

List.prototype.concat = function concat(other) {
  return new List(this.values).append(other);
};

List.prototype.filter = function filter(fun) {
  const filtered = new List();
  for (let i = 0; i < this.length(); i += 1) {
    if (fun(this.values[i])) {
      filtered.push(this.values[i]);
    }
  }
  return filtered;
};

List.prototype.map = function map(fun) {
  const mapped = new List();
  for (let i = 0; i < this.length(); i += 1) {
    mapped.push(fun(this.values[i]));
  }
  return mapped;
};

List.prototype.foldl = function foldl(fun, init) {
  let acc = init;

  for (let i = 0; i < this.length(); i += 1) {
    acc = fun(this.values[i], acc);
  }

  return acc;
};

List.prototype.foldr = function foldr(fun, init) {
  let acc = init;

  for (let i = this.length() - 1; i >= 0; i -= 1) {
    acc = fun(this.values[i], acc);
  }

  return acc;
};

List.prototype.swap = function swap(i, j) {
  const temp = this.values[i];
  this.values[i] = this.values[j];
  this.values[j] = temp;
  return this;
};

List.prototype.reverse = function reverse() {
  const length = this.length();
  const middle = Math.floor(length / 2);

  for (let i = 0, j = length - 1; i < middle; i += 1, j -= 1) {
    this.swap(i, j);
  }

  return this;
};

module.exports = List;
