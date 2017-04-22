=begin

Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

=end

def square_of_sum(number)
  ((1..number).reduce(0) { |memo, current| memo + current })**2
end

def sum_of_squares(number)
  (1..number).reduce(0) { |memo, current| memo + current**2 }
end

def sum_square_difference(number)
  square_of_sum(number) - sum_of_squares(number)
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
