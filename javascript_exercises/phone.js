// Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.

// The rules are as follows:

// Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.
// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

function numberDigits(string) {
  return string.match(/[0-9]/g).join('');
}

function cleanPhoneNumber(string) {
  var badString = '0000000000';
  var digits = numberDigits(string);
  
  if (digits.length === 10) {
    return digits;
  } else if (digits.length === 11 && digits[0] === '1') {
    return digits.slice(1);
  } else {
    return badString;
  }
}

console.log(cleanPhoneNumber('(12345678--90)') === '1234567890');
console.log(cleanPhoneNumber('123(45)6789') === '0000000000');
console.log(cleanPhoneNumber('123456789') === '0000000000');
console.log(cleanPhoneNumber('1234567890') === '1234567890');
console.log(cleanPhoneNumber('12345678900') === '2345678900');
console.log(cleanPhoneNumber('22345678900') === '0000000000');
console.log(cleanPhoneNumber('123456789012') === '0000000000');
