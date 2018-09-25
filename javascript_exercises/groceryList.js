// Write a function that takes a grocery list (a two-dimensional array) with each element containing a fruit and a quantity, and returns a one-dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.

// -- write a function repeat that takes a string s and an integer n and returns an array with s repeated n times.
// -- the main function buyFruit folds the given array into a new array, obtained by successively appending "repeat" arrays obtained above.

function buyFruit(list) {
  function repeat(item, times) {
    return Array(times).fill(item);
  };

  return list.reduce(function(fruits, item) {
    return fruits.concat(repeat(item[0], item[1]));
  }, []);
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
console.log(buyFruit([]));
// returns []
