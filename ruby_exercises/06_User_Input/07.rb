USER = "ben"
PASSWORD = "julia"
loop do
  puts "Please enter your username"
  user_try = gets.chomp
  puts "Please enter your password"
  password_try = gets.chomp
  break if user_try == USER && password_try == PASSWORD
  puts "Nope"
end

puts "Welcome, Ben!"
