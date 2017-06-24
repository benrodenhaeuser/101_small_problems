def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numbers = [nil, nil]
numbers.each_index do |i|

  loop do
    puts "Enter the numerator" if i == 0
    puts "Enter the denominator" if i == 1
    numbers[i] = gets.chomp
    if valid_number?(numbers[i])
      break if i == 0 || (i == 1 && numbers[i] != '0')
    end
    puts "This looks fishy"
  end

end

result = numbers[0].to_i / numbers[1].to_i
puts "#{numbers[0]} divided by #{numbers[1]} is #{result}"

# It would probably be clearer if we just made two loops ... (which is the launchschool solution)
