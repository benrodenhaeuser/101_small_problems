loop do
  puts "How many lines of output do you want?"
  input_string = gets.chomp.downcase
  break if input_string == 'q'
  number_of_lines = input_string.to_i
  if number_of_lines >= 3
    number_of_lines.times { puts "There you go" }
    next
  end
  puts "At least 3 needed"
end
