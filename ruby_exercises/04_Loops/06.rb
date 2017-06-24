# print 5 random numbers between 0 and 99:

counter = 0
while counter != 5
  puts rand(0...100)
  counter += 1
end

puts

# or if we wanted to store the numbers in an array:

numbers = []
while numbers.size < 5
  numbers << rand(0...100)
end

puts numbers
