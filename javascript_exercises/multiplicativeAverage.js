var arrayProduct = function arrayProduct(array) {
  if (array.length === 0) { return 0; }

  var theProduct = 1;

  for (var i = 0; i < array.length; i++) {
    theProduct *= array[i];
  }

  return theProduct;
}


var showMultiplicativeAverage = function showMultiplicativeAverage(array) {
  var avg = arrayProduct(array) / array.length;
  console.log(avg.toFixed(3));
};


showMultiplicativeAverage([3, 5]);                   // "7.500"
showMultiplicativeAverage([2, 5, 7, 11, 13, 17]);    // "28361.667"
