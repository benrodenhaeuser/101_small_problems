answer = nil

loop do
  puts "How many lines of output do you want?"
  answer = gets.chomp.to_i
  break if answer >= 3
  puts "At least 3 needed"
end

answer.times { puts "There you go." }
