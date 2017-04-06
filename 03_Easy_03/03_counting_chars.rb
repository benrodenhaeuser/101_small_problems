print "please write word or multiple words: "
words = gets.chomp

number_of_chars = words.split(' ').join('').chars.count

# alternative: words.delete(' ').size
# alternative: words.delete(' ').length

puts "There are #{number_of_chars} characters in #{words}"
