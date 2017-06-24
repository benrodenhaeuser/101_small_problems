puts 'What does 2 + 2 equal?'
loop do
  answer = gets.chomp.to_i
  if answer == 4
    puts "Yes!"
    break
  end
  puts "Wrong! Again!"
end
