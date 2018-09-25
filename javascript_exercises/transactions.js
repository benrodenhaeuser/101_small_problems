function transactionsFor(id, transactions) {
  return transactions.filter(function(transaction) {
    return transaction.id === id;
  });
}

function isItemAvailable(id, transactions) {
  var list = transactionsFor(id, transactions);
  var quantity = list.reduce(function(quant, item) {
    if (item.movement === 'in') {
      return quant + item.quantity;
    } else {
      return quant - item.quantity;
    }
  }, 0);

  return quantity > 0;
}


var transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true
