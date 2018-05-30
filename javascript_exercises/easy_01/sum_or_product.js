var sum = function sum(number) {
  var theSum = 0;

  for (i = 1; i <= number; i++) {
    theSum += i;
  }

  return theSum;
}

var product = function product(number) {
  var theProduct = 1;

  for (i = 1; i <= number; i++) {
    theProduct *= i;
  }

  return theProduct;
}

var calculation = function calculation() {
  var number;
  var operation;
  var result;

  number = Number(prompt("Please enter a positive integer:"));

  while (true) {
    operation = prompt('Enter "s" to compute the sum, or "p" to compute the product.');
    if (operation === 's' || operation === 'p') { break };
    console.log("Go again?!?");
  }

  result = (operation === 's' ? sum(number) : product(number));

  console.log("The result is " + String(result));
}

calculation();
