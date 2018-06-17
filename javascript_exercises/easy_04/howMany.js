function countOccurrences(list) {
  var counts = {};
  var i;

  for (i = 0; i < list.length; i++) {
    counts[list[i]] = counts[list[i]] || 0;
    counts[list[i]] += 1;    
  }

  for (thing in counts) {
    console.log(thing + " => " + counts[thing]);
  }

}


var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// // console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
