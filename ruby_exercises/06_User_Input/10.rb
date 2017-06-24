# Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.
#Do not check for positive/negative requirement until after both integers are entered, and start over if the requirement is not met.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

numbers = [nil, nil]

loop do

  numbers.each_index do |index|
    loop do
      puts "Enter a positive integer"
      input_string = gets.chomp
      numbers[index] = input_string.to_i
      break if valid_number?(input_string)
      puts "Invalid input"
    end
  end

  break if ((numbers[0] > 0 && numbers[1] < 0 ) || (numbers[1] > 0 && numbers[0] < 0 ))
  puts "one number should be greater than 0, the other one smaller than 0"
end

result = numbers[0] + numbers[1]

puts "#{numbers[0]}+#{numbers[1]}=#{result}"
