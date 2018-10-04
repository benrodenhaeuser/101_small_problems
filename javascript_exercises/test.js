function foo(x) {
  if (x === 0) { return x + 1; }
  return false;
}

function bar() { return undefined; }

foo(1);
bar();
