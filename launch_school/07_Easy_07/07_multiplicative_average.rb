=begin

Write a method that takes an Array of integers as input, multiplies all of the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places.

=end

def product(array)
  array.inject(1) { |product, multiplier| product * multiplier  }
end

def show_multiplicative_average(array)
  multiplicative_average = product(array) / array.size.to_f
  puts "The result is #{format('%.3f', multiplicative_average)}"
end

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts format('%.3f', average)
end

show_multiplicative_average([3, 5])
# => The result is 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# => The result is 28361.667
