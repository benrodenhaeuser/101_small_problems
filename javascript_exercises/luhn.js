// The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers Canadian Social Insurance Numbers.
//
// The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:
//
// Counting from the rightmost digit and moving left, double the value of every second digit
// For any digit that thus become 10 or more, subtract 9 from the reuslt
// 1111 becomes 2121
// 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
// Add all these digits together
// 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
// 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
// If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).
//
// Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

/*

PROBLEM

- input: string consisting of some digits and potentially some non-numeric chars
- output: boolean (is number represented by digits valid according to Luhn formula?)

Luhn formula:

Step 1: Counting from the rightmost digit and moving left, double the value of every second digit

1234 becomes 2264

For any digit that thus become 10 or more, subtract 9 from the reuslt

8763 becomes 7733

(from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)

Step 2: Add all these digits together

1234 becomes 1438 becomes 1 + 4 + 3 + 8 = 16
8763 becomes 7733 becomes 7 + 7 + 3 + 3 = 20

Step 3:

If the result of step 3 ends in 0, then the initial number is valid.
Else it is not.

1234 is not valid (16 does not end in 0)
8763 is valid (20 does end in 0)

2323 2005 7766 3554 is valid.

DATA STRUCTURE

- array of numbers (because we will have to do numeric manipulations on
  individual digits)

ALGORITHM
- clean input from non-numeric chars: match against /[0-9]/g gives array
- transform to array of numbers
- "step 1":
  - double every second digit starting from end of array
  - normalize doubled digits that overflow 10 by subtracting 9
- "step 2":
  - compute checksum of all digits
- "step 3":
  - check whether terminal digit is 0.

*/

function doubleEverySecond(digits) {
  var result = digits.slice();
  for (var i = digits.length - 2; i >= 0; i -= 2) {
    var doubled = digits[i] * 2;
    if (doubled >= 10) { doubled -= 9; }
    result[i] = doubled;
  }
  return result;
}

function checksum(digits) {
  function sum(number1, number2) {
    return number1 + number2;
  }

  return digits.reduce(sum);
}

function luhnValid(string) {
  var digits = string.match(/[0-9]/g);

  if (digits === null) { return true; } // matter of taste/application needs

  digits = digits.map(Number);

  var luhnSum = checksum(doubleEverySecond(digits));

  return luhnSum % 10 === 0;
}

// tests
console.log(luhnValid('') === true);
console.log(luhnValid('0') === true);
console.log(luhnValid('0000') === true);
console.log(luhnValid('1010') === false);
console.log(luhnValid('1234') === false);
console.log(luhnValid('8763') === true);
console.log(luhnValid('2323200577663554') === true);

// ignore other chars
console.log(luhnValid('0-0-0-0') === true);
console.log(luhnValid('1 2 3 4') === false);
console.log(luhnValid('(8763)') === true);
console.log(luhnValid('2323-2005-7766-3554') === true);
