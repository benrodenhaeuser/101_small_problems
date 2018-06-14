function Bob() {}

Bob.prototype.hey = function hey(req) {
  var reqUpper = req.toUpperCase();
  var reqWhitoutBlanks = req.replace(/\s/g, '');
  var reqOnlyLetters = req.replace(/[^a-zA-Z]/g, '');
  var lastNonBlankChar = reqWhitoutBlanks[reqWhitoutBlanks.length - 1];
  var resp;

  var question = (lastNonBlankChar === '?');
  var shouting = (reqUpper === req && reqOnlyLetters !== '');
  var silence = (reqWhitoutBlanks === '');

  if (question && shouting) {
    resp = "Calm down, I know what I'm doing!";
  } else if (question) {
    resp = "Sure.";
  } else if (shouting) {
    resp = "Whoa, chill out!";
  } else if (silence) {
    resp = "Fine. Be that way!";
  } else {
    resp = "Whatever."
  }

  return resp;
}

module.exports = Bob;
