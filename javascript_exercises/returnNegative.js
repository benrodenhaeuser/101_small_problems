// Write a function that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the argument is a negative number, return it as-is.

var negative = function (number) {
  return number <= 0 ? number : -number; 
};

 console.log(negative(5));     // -5
 console.log(negative(-3));    // -3
 console.log(negative(0));     // -0
