PASSWORD = "julia"
loop do
  puts "Please enter your password"
  input = gets.chomp
  break if input == PASSWORD
  puts "Nope"
end

puts "Welcome, Ben!"
