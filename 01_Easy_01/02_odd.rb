def is_odd?(number)
  number % 2 == 1
end

p is_odd?(-3) # => true

# by the way: to get the absolute value of a number:
number = -10
p number.abs
