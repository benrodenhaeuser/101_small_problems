=begin
Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

approach: for (5, 1), we want the array to contain

1 * 1
2 * 1
3 * 1
4 * 1
5 * 1

in other words, (1..5).each { |number| number * starting_value }

5 is our number of elements here, so we want

=end

def sequence(number_of_multiples, multiplier)
  (1..number_of_multiples).map { |number| number * multiplier }
end

# what if we were not allowed to use map?

def sequence(number_of_multiples, multiplier)
  result = []
  (1..number_of_multiples).each { |number| result << number * multiplier }
  result
end

# what if we were not allowed to use any iterator?

# start with index 1
# calculate current result and push to result
# increment index
# break if index > number_of_multiples
# take care of the extra case that number_of_multiples is 0

def sequence(number_of_multiples, multiplier)
  return [] if number_of_multiples == 0
  result = []
  current_number = 1
  loop do
    result << current_number * multiplier
    current_number += 1
    break if current_number > number_of_multiples
  end
  result
end

# what if we were not allowed to have multiple points of return?
# we can simplify it to:

def sequence(number_of_multiples, multiplier)
  result = []
  current_number = 1
  loop do
    break if current_number > number_of_multiples # catches edge case
    result << current_number * multiplier
    current_number += 1
  end
  result
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
