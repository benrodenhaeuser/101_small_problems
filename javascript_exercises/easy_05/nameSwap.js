// Write a function that takes a string argument consisting of a first name, a space, and a last name, and returns a new string consisting of the last name, a comma, a space, and the first name.

var swapName = function (name) {
  return name.split(' ').reverse().join(', ');
};

console.log(swapName('Joe Roberts'));


// what if there are possibly more than one first name?

var swapLongName = function (name) {
  var firstNames = name.split(' ').slice(0, -1).join(' ');
  var lastName = name.split(' ').slice(-1).join('');

  return([lastName, firstNames].join(', '));
}

console.log(swapLongName('Lotte Lenia Rodenhäuser'));
