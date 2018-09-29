// Write a function that takes a string as an argument and returns true if the string contains properly balanced parentheses, false otherwise. Parentheses are properly balanced only when '(' and ')' occur in matching pairs, with each pair starting with '('.

// problem:
// - input: string
// - output: boolean (parentheses in string balanced?)

// what does it mean to be balanced?
// 1. there is an even number of opening and closing parentheses
// 2. every closing parenthesis is preceded by a matching opening parenthesis

// approach
// - initially, the balance of opening and closing parentheses is 0
// - iterate over the string characters, incrementing the balance if we see a
//   `(`, and decrementing the balance if we see a ')'.
// - at no point can the balance be negative (criterion 2)
// - in the end, the balance should be 0 (criterion 1)

function isBalanced(string) {
  var balance = 0;

  while (string !== '') {
    if (string[0] === '(') {
      balance += 1;
    } else if (string[0] === ')') {
      balance -= 1;
    }

    if (balance < 0) { return false; }
    string = string.slice(1);
  }
  return balance === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
