// Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

function getRandomIntInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

console.log(getRandomIntInclusive(20, 200));

// max - min + 1 is 200 - 20 + 1 = 181
// Math.random is between 0 (incl) and 1 (excl)
// So Math.random() * (max - min + 1)) generates random number between 0 and 180
// Thus adding min to the result gives random number between 20 (incl) and 200 (incl)
