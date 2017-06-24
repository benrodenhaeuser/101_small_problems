=begin

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

Further exploration: What about negative numbers?

=end

def sequence(number)
  number > 0 ? (1..number).to_a : (number..-1).to_a.reverse
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-10) == [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]
