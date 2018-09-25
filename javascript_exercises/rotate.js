function rotateArray(array) {
  if (!Array.isArray(array)) { return undefined; }
  if (array.length === 0) { return array; }

  var rotated = array.slice();
  rotated.push(rotated.shift());
  return rotated;
}

function rotateRightmostDigits(number, n) {
  var digits = String(number).split('');

  if (n > digits.length || n <= 0) { return number; }

  var leftPart = digits.slice(0, digits.length - n);
  var rightPart = digits.slice(digits.length - n);
  var rotated = rotateArray(rightPart);

  return Number(leftPart.concat(rotated).join(''));
}

// Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175. Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally, keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.


function maxRotation(number) {
  var max = String(number).length;
  var min = 2;

  if (max < min) { return number; } // the number has one digit or less.

  var rotated = number;

  for (var i = max; i >= min; i -= 1) {
    rotated = rotateRightmostDigits(rotated, i);
  }

  return rotated;
}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845
