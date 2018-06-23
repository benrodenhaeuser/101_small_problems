function Rational(p, q) {
  this.numerator = p;
  this.denominator = q;
}

Rational.prototype.abs = function abs() {
  const p = Math.abs(this.numerator);
  const q = Math.abs(this.denominator);

  return new Rational(p, q);
};

Rational.prototype.reduce = function reduce() {
  if (this.denominator < 0) {
    this.numerator = -this.numerator;
    this.denominator = -this.denominator;
  }

  const divisor = this.greatestCommonDivisor();

  this.numerator = this.numerator / divisor;
  this.denominator = this.denominator / divisor;

  return this;
};

Rational.prototype.greatestCommonDivisor = function greatestCommonDivisor() {
  const p = Math.abs(this.numerator);
  const q = Math.abs(this.denominator);

  function gcd(a, b) {
    if (a < b) { return gcd(b, a); }
    if (b === 0) { return a; }
    return gcd(b, a % b);
  }

  return gcd(p, q);
};

Rational.prototype.add = function add(other) {
  const a1 = this.numerator;
  const b1 = this.denominator;
  const a2 = other.numerator;
  const b2 = other.denominator;

  return new Rational((a1 * b2) + (a2 * b1), b1 * b2).reduce();
};

Rational.prototype.sub = function sub(other) {
  const a1 = this.numerator;
  const b1 = this.denominator;
  const a2 = other.numerator;
  const b2 = other.denominator;

  return new Rational((a1 * b2) - (a2 * b1), b1 * b2).reduce();
};

Rational.prototype.mul = function mul(other) {
  const a1 = this.numerator;
  const b1 = this.denominator;
  const a2 = other.numerator;
  const b2 = other.denominator;

  return new Rational(a1 * a2, b1 * b2).reduce();
};

Rational.prototype.div = function div(other) {
  const a1 = this.numerator;
  const b1 = this.denominator;
  const a2 = other.numerator;
  const b2 = other.denominator;

  return new Rational(a1 * b2, a2 * b1).reduce();
};

Rational.prototype.exprational = function exprational(exp) {
  const a = this.numerator;
  const b = this.denominator;

  if (exp >= 0) { return new Rational(a ** exp, b ** exp); }
  return new Rational(b ** -exp, a ** -exp);
};

Rational.prototype.expreal = function expreal(realNumber) {
  const a = this.numerator;
  const b = this.denominator;

  return realNumber ** (a / b);
};

module.exports = Rational;
