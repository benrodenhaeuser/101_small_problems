// Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip, and then log both the tip and the total amount of the bill to the console. You can ignore input validation and assume that the user will put in numbers.

var tip = function tip() {
  var billAmount = Number(prompt("Bill amount?"));
  var tipRate = Number(prompt("Tip rate?"));

  var tipAmount = billAmount * tipRate;
  var billAmountWithTip = billAmount + tipAmount;

  console.log("Tip: " + tipAmount.toFixed());
  console.log("Total: " + billAmountWithTip.toFixed());
}

tip();
