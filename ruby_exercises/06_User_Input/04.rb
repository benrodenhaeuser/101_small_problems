loop do
  puts "print something?"
  answer = gets.chomp.downcase
  if answer == "y"
    puts "something"
    break
  elsif answer == "n"
    break
  end
  puts "invalid input, try again"
end

# launchschool solution:
choice = nil # we might need choice outside of the loop
loop do
  puts '>> Do you want me to print something? (y/n)'
  choice = gets.chomp.downcase
  break if %w(y n).include?(choice)
  puts '>> Invalid input! Please enter y or n'
end
puts 'something' if choice == 'y' # here we use choice
