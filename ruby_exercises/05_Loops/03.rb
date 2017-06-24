process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "loop processed"
    break
  end
else
  puts "not processed"
end
