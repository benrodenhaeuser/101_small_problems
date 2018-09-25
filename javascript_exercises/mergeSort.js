// merge two sorted arrays, while preserving sortedness.
// do not mutate the sorted arrays.

function merge(array1, array2) {
  var merged = [];

  while (array1.length > 0 && array2.length > 0) {
    if (array1[0] <= array2[0]) {
      merged.push(array1[0]);
      array1 = array1.slice(1);
    } else {
      merged.push(array2[0]);
      array2 = array2.slice(1);
    }
  }

  return merged.concat(array1).concat(array2);
}

function mergeSort(array) {
  if (array.length === 1) { return array; }

  var oneHalf   = array.slice(0, array.length / 2);
  var otherHalf = array.slice(array.length / 2, array.length);

  return merge(sort(oneHalf), sort(otherHalf));
}
