function copyNonDupsTo(resultArray, array) {
  var copyNonDupElem = function (value) {
    if (resultArray.indexOf(value) === -1) {
      resultArray.push(value);
    }
  };

  array.forEach(copyNonDupElem);
}

function union(array1, array2) {
  var newArray = [];
  copyNonDupsTo(newArray, array1);
  copyNonDupsTo(newArray, array2);
  console.log(newArray);
}

union([1, 3, 5], [3, 6, 9]);    // [1, 3, 5, 6, 9]
