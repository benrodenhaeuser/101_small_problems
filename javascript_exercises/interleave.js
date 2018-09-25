// Write a function that combines two arrays passed as arguments, and returns a new array that contains all elements from both array arguments, with each element taken in alternation.
//
// You may assume that both input arrays are non-empty, and that they have the same number of elements.

var interleave = function interleave(array1, array2) {
  var interleaved = [];

  for (var i = 0; i < array1.length; i++) {
    interleaved.push(array1[i]);
    interleaved.push(array2[i]);
  }

  console.log(interleaved);
}

interleave([1, 2, 3], ['a', 'b', 'c']);    // [1, "a", 2, "b", 3, "c"]
