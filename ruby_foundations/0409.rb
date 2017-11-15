# define enumerator that yields factorials
factorials = Enumerator.new do |yielder|
  number = 0
  factorial = 1

  loop do
    yielder << factorial
    number += 1
    factorial = factorial * (number)
  end
end

# "external" iteration
def print7(enumerator)
  index = 0
  while index < 7
    p enumerator.next
    index += 1
  end
end

print7(factorials)

# resetting the enumerator
factorials.rewind

# "internal" iteration
puts factorials.take(7)
