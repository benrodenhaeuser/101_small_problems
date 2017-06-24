number = 1
loop do
  puts "#{number} is even" if number.even?
  puts "#{number} is odd" if number.odd?
  number += 1
  break if number > 5
end
