def fibo(list, index)
  list[index] ||= fibo(list, index - 1) + fibo(list, index - 2)
end

def fibonacci(n)
  fibo([1, 1], n - 1)
end

puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
