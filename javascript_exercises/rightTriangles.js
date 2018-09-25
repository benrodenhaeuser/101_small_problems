// Write a function that takes a positive integer, n, as an argument, and logs a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

// algorithm:

// think of the triangle as a sequence of lines
// each line is composed of blanks and asterisks
// there are n lines of length n

// line 0: n     blanks, 0 asteriss
// line 1: n - 1 blanks, 1 asterisk
// line 2: n - 2 blanks, 2 asterisks
// ...
// line n: n - n blanks, n asterisks

// i.e.,:
// line i: n - i blanks, i asterisks
// for i from 0 to n

var repeatChar = function repeatChar(char, times) {
  var repeated = '';
  while (times > 0) {
    repeated += char;
    times -= 1;
  }
  return repeated;
};

var line = function line(blanks, asterisks) {
  return repeatChar(" ", blanks) + repeatChar("*", asterisks);
};

var triangle = function triangle(n) {
  for (var i = 1; i <= n; i++) {
    console.log(line(n - i, i));
  }
};

triangle(9);
