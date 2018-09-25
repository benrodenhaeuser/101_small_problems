function multiplyPairs(list1, list2) {
  var multiples = list1.reduce(function (multiples, number1) {
    list2.forEach(function (number2) {
      multiples.push(number1 * number2);
    });

    return multiples;
  }, []);

  return multiples.sort(function (number1, number2) {
    return number1 - number2;
  });
}

console.log(multiplyPairs([2, 4], [4, 3, 1, 2]));
