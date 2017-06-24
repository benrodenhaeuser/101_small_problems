=begin

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# in other words we want to implement the function f
# which is defined by f(x) = y
# iff y is the smallest number such that the length of fibonacci(y) in digits is x

approach:

- first step: examples:

fibo_index(1) should return 1 because 1 is the smallest number such that fibonnaci(1) has length 1
fibo_index(2) should return 6 because 6 is the smallest number such that fibonnaci(?) has length 1

- "brute force": we compute the full fibonacci sequence until we hit one that has the length given as an argument
- that is: given length_in_digits x
  - compute fibonacci(1) — if it has length x, return 1
  - compute fibonacci(2) - if it has length x, return 2
  - and so on
- this can be implemented roughly as follows:

  input argument: number_of_digits

  index = 1
  while length_of(fibonacci(index)) < number_of_digits
    index += 1
  end
  index

- we see that we need a method that computes the length of a number, and we need to
  implement above method
=end

def fibonacci(x)
  if x <= 2
    1
  else
    fibonacci(x - 1) + fibonacci(x - 2)
  end
end

def length_of(number)
  number.to_s.length
end

def smallest_fibo_index(number_of_digits)
  index = 1
  while length_of(fibonacci(index)) < number_of_digits
    index += 1
  end
  index
end

# p smallest_fibo_index(1) == 1
# p smallest_fibo_index(2) == 7
# p smallest_fibo_index(3) == 12
# p smallest_fibo_index(4) == 17
# p smallest_fibo_index(5) == 21
# p smallest_fibo_index(10)

# the problem with this solution is that it quickly gets super-slow because of
# the huge number of method calls in play

# Launch School suggests a different method of going with one method that
# builds the Fibonacci series with a loop

def smallest_fibo_index(number_of_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.length >= number_of_digits
    first = second
    second = fibonacci
  end

  index
end

# p smallest_fibo_index(1) == 1
p smallest_fibo_index(2) == 7
p smallest_fibo_index(3) == 12
p smallest_fibo_index(4) == 17
p smallest_fibo_index(5) == 21
p smallest_fibo_index(10) == 45
