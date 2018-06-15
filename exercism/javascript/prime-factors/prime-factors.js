var primeFactors = {};

primeFactors.for = function primesFor(number) {
  var currentNumber = number;
  var currentFactor = 2;
  var quotient;
  var factors = [];

  while (currentNumber > 1) {
    quotient = currentNumber / currentFactor;

    if (Math.floor(quotient) === quotient) {
      factors.push(currentFactor);
      currentNumber = quotient;
    } else {
      currentFactor += 1;
    }
  }

  return factors;
};

module.exports = primeFactors;
