

numbers = [7, 9, 13, 25, 18]

until numbers.size == 0
  p numbers.first
  numbers.shift
end

puts

# if we want to avoid destroying the array, we could use a counter

numbers = [7, 9, 13, 25, 18]
counter = 0

until counter == numbers.size
  p numbers[counter]
  counter += 1
end
