function Node(data) {
  this.data = data;
  this.next = null;
  this.prev = null;
}

function LinkedList() {
  this.first = null;
  this.last = null;
}

LinkedList.prototype.push = function push(data) {
  if (this.last) {
    this.last.next = new Node(data);
    this.last.next.prev = this.last;
    this.last = this.last.next;
  } else {
    this.last = new Node(data);
    this.first = this.last;
  }
};

LinkedList.prototype.unshift = function unshift(data) {
  if (this.first) {
    this.first.prev = new Node(data);
    this.first.prev.next = this.first;
    this.first = this.first.prev;
  } else {
    this.first = new Node(data);
    this.last = this.first;
  }
};

LinkedList.prototype.pop = function pop() {
  var data = this.last.data;
  if (this.last !== this.first) {
    this.last.prev.next = null;
    this.last = this.last.prev;
  } else {
    this.last = null;
    this.first = null;
  }
  return data;
};

LinkedList.prototype.shift = function shift() {
  var data = this.first.data;
  if (this.last !== this.first) {
    this.first.next.prev = null;
    this.first = this.first.next;
  } else {
    this.first = null;
    this.last = null;
  }
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
