def add(number_1, number_2)
  number_1 + number_2
end

def multiply(number_1, number_2)
  number_1 * number_2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
