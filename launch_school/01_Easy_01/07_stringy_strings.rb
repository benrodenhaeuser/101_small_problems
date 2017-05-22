=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

=end

# my implementation: with a while loop

def toggle(input)
  case input
  when '0' then '1'
  when '1' then '0'
  end
end

def stringy(number)
  counter = number
  stringy_string = ''
  toggler = '1'
  while counter > 0
    stringy_string << toggler
    toggler = toggle(toggler)
    require 'pry'; binding.pry
    counter -= 1
  end
  stringy_string
end

# another implementation using times and the ternary operator

def stringy(number)
  numbers_string = ''
  number.times do |index|
    the_number = index.even? ? '1' : '0'
    numbers_string << the_number
  end
  numbers_string
end

puts stringy(6) == '101010' # true
puts stringy(9) == '101010101' # true
puts stringy(4) == '1010' # true
puts stringy(7) == '1010101' # true
