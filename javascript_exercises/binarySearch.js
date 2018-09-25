function binarySearch(list, item) {
  var left = 0;
  var right = list.length - 1;
  var middle;

  while (left <= right) {
    middle = Math.floor((left + right) / 2);

    if (list[middle] === item) { return middle; }

    if (list[middle] < item) {
      left = middle + 1;
    } else { // list[middle] > item
      right = middle - 1;
    }
  }

  return -1;
}

var list = [10, 20, 30, 40, 50, 60]
console.log(binarySearch(list, 30)); // 2
console.log(binarySearch(list, 25 )); // -1
console.log(binarySearch([], 10)); // -1

var yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Ruby Lounge', 'Zooper'];
console.log(binarySearch(yellowPages, 'Pizzeria'));                   // 7
console.log(binarySearch(yellowPages, 'Apple Store'));                // 0

console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77));    // -1
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89));    // 7
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5));     // 1

console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter'));  // -1
console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler'));  // 6

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(binarySearch(numbers, 1)) // 0
console.log(binarySearch(numbers, 2)) // 1
console.log(binarySearch(numbers, 3)) // 2
console.log(binarySearch(numbers, 4)) // 3
console.log(binarySearch(numbers, 5)) // 4
