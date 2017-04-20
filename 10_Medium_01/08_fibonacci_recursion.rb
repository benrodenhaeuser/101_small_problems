def fibonacci(number)
  if number <= 2
    1
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# tail-recursive solution (much much faster)
def fibonacci_tail(n, acc1, acc2)
  if n == 1
    acc1
  elsif n == 2
    acc2
  else
    fibonacci_tail(n - 1, acc2, acc2 + acc1)
  end
end

def fibonacci_rec(n)
  fibonacci_tail(n, 1, 1)
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(8000)
