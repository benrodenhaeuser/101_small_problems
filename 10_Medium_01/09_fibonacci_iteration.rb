# iterative solution to fibonacci

def fibonacci(number)
  first = 1
  second = 1
  fibo = 1

  next_num = 3

  loop do
    break if next_num > number

    fibo = first + second
    first = second
    second = fibo

    next_num += 1
  end

  fibo

end

# test

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

1.upto(1000) { |n| p fibonacci(n) == fibonacci_rec(n) }


# Launch School solution

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

# Ozgur's solution

def fibonacci(num)
  fib = [1, 1]
  (num-2).times { fib << fib.last(2).inject(:+) }
  fib.last
end


# Nick's solution
def fibonacci(n)
  (3..n).reduce([1, 1]) { |(a, b), _| [b, a + b] }.last
end

# Nick's second solution
def fibonacci(n)
  fib = Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end
  fib.take(n).last
end
