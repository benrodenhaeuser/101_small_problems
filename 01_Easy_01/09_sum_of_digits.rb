# write a method that sums up the digits of a number

def sum(number)
  numbers = number.to_s.split('').map { |number| number.to_i }.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45


# Launch School solution:
# number.to_s.chars.map(&:to_i).reduce(:+)

# 23.to_s        # => "23"
#   .chars       # => ["2", "3"]
#   .map(&:to_i) # => [2, 3]
#   .reduce(:+)  # => 5
