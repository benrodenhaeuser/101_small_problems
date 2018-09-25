// F(1) = 1
// F(2) = 1
// F(n) = F(n - 1) + F(n - 2) where n > 2

function fibonacci(n) {
  if (n === 1 || n === 2) { return 1; }

  return fibonacci(n - 1) + fibonacci(n - 2);
}

// console.log(fibonacci(1));       // 1
// console.log(fibonacci(2));       // 1
// console.log(fibonacci(3));       // 2
// console.log(fibonacci(4));       // 3
// console.log(fibonacci(5));       // 5
// console.log(fibonacci(12));      // 144
// console.log(fibonacci(20));      // 6765

function fibonacci_iter(n) {
  if (n === 1 || n === 2) { return 1; }

  var first = 1;
  var second = 1;
  var counter = 3;

  var fibo;

  while (counter <= n) {
    fibo = first + second;
    first = second;
    second = fibo;
    counter += 1;
  }

  return fibo;
}

// console.log(fibonacci_iter(1));       // 1
// console.log(fibonacci_iter(2));       // 1
// console.log(fibonacci_iter(3));       // 2
// console.log(fibonacci_iter(4));       // 3
// console.log(fibonacci_iter(5));       // 5
// console.log(fibonacci_iter(12));      // 144
// console.log(fibonacci_iter(20));      // 6765
// console.log(fibonacci_iter(50));       // 12586269025
// console.log(fibonacci_iter(100));      // 354224848179261915075

function fibonacci_iter2(n) {
  var fibo = [1, 1];

  while (fibo.length < n) {
    len = fibo.length;
    fibo.push(fibo[len - 1] + fibo[len - 2]);
  }

  return fibo[fibo.length - 1];
}

// console.log(fibonacci_iter2(1));       // 1
// console.log(fibonacci_iter2(2));       // 1
// console.log(fibonacci_iter2(3));       // 2
// console.log(fibonacci_iter2(4));       // 3
// console.log(fibonacci_iter2(5));       // 5
// console.log(fibonacci_iter2(12));      // 144
// console.log(fibonacci_iter2(20));      // 6765

// ==> consumes more memory than fibonacci_iter

function fibonacci_memo(n) {
  function fibo(list, index) {
    if (list[index]) { return list[index]; }
    return list[index] = fibo(list, index - 1) + fibo(list, index - 2);
  }

  return fibo([1, 1], n - 1);
}

console.log(fibonacci_memo(1));       // 1
console.log(fibonacci_memo(2));       // 1
console.log(fibonacci_memo(3));       // 2
console.log(fibonacci_memo(4));       // 3
console.log(fibonacci_memo(5));       // 5
console.log(fibonacci_memo(12));      // 144
console.log(fibonacci_memo(20));      // 6765
console.log(fibonacci_memo(50));       // 12586269025
