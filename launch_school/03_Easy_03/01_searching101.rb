nth = %w[1st 2nd 3rd 4th 5th, last]
numbers = []

nth.each_with_index do |value, index|
  puts "==> Enter the #{value} number:"
  numbers << gets.chomp.to_i
end

last = numbers.pop

if numbers.any? { |elem| elem == last }
  puts "The number #{last} appears in #{numbers}."
else
  puts "The number #{last} does not appear in #{numbers}."
end

# include? would be a better choice than any? here.
