var double = function double(number) {
  if (String(number).length % 2 === 1) { return false; }

  number = String(number);

  var middle = number.length / 2;
  var leftHalf = number.slice(0, middle);
  var rightHalf = number.slice(middle);

  return leftHalf === rightHalf;
};

var twice = function twice(number) {
  if (double(number)) {
    return number;
  } else {
    return number * 2;
  }
};

console.log(twice(37) === 74);
console.log(twice(44) === 44);
console.log(twice(334433) === 668866);
console.log(twice(444) === 888);
console.log(twice(107) === 214);
console.log(twice(103103) === 103103);
console.log(twice(3333) === 3333);
console.log(twice(7676) === 7676);
