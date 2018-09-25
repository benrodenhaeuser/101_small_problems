// Write a function that will take a short line of text, and write it to the console log within a box.

var repeatChar = function repeatChar(char, times) {
  var repeated = '';
  while (times > 0) {
    repeated += char;
    times -= 1;
  }
  return repeated;
};

var horizontalEdge = function horizontalEdge(length) {
  return "+" + repeatChar("-", length - 2) + "+\n";
};

var padLine = function padLine(length) {
  return "|" + repeatChar(" ", length - 2) + "|\n";
};

var textLine = function textLine(string) {
  return "| " + string + " |\n";
};

var logInBox = function logInBox(string) {
  var width = string.length + 4;

  var edge = horizontalEdge(width);
  var pad = padLine(width);
  var text = textLine(string);

  console.log(edge + pad + text + pad + edge);
};


logInBox('To boldly go where no one has gone before.');

logInBox('');
