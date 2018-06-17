function Node(data) {
  this.data = data;
  this.next = null;
  this.prev = null;
}

Node.prototype.append = function append(node) {
  this.next = node;
  node.prev = this;
};

Node.prototype.prepend = function prepend(node) {
  this.prev = node;
  node.next = this;
};

function LinkedList() {
  this.first = null;
  this.last = null;
}

Object.defineProperty(LinkedList.prototype, "empty", {
  get: function() { return this.last === null; }
});

LinkedList.prototype.push = function push(data) {
  var node = new Node(data);

  if (this.empty) {
    this.last = node;
    this.first = node;
  } else {
    this.last.append(node);
    this.last = node;
  }
};

LinkedList.prototype.pop = function pop() {
  var data = this.last.data;
  this.last = this.last.prev;
  this.last ? this.last.next = null : this.first = null;
  return data;
};

LinkedList.prototype.unshift = function unshift(data) {
  var node = new Node(data);
  if (this.empty) {
    this.first = node;
    this.last = node;
  } else {
    this.first.prepend(node);
    this.first = node;
  }
};

LinkedList.prototype.shift = function shift() {
  var data = this.first.data;
  this.first = this.first.next;
  this.first ? this.first.prev = null : this.last = null;
  return data;
};

LinkedList.prototype.count = function count() {
  var node = this.first;
  var counter = 0;
  while (node) {
    counter += 1;
    node = node.next;
  }
  return counter;
};

// delete *all* occurences of data from linked list
LinkedList.prototype.delete = function remove(data) {
  var node = this.first;

  while (node) {
    if (node.data === data) {
      if (node.prev && node.next) {
        node.prev.next = node.next;
        node.next.prev = node.prev;
      } else if (node.prev) {
        node.prev.next = null;
        this.last = node.prev;
      } else if (node.next) {
        node.next.prev = null;
        this.first = node.next;
      } else {
        this.first = null;
        this.last = null;
      }
    }
    node = node.next;
  }
};

module.exports = LinkedList;
