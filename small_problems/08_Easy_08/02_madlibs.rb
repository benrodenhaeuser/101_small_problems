=begin

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

=end

def prompt(string)
  print "enter #{string}: "
end

libs = {}

prompt('noun')
libs[:noun] = gets.chomp
prompt('verb')
libs[:verb] = gets.chomp
prompt('adjective')
libs[:adjective] = gets.chomp
prompt('adverb')
libs[:adverb] = gets.chomp

puts

puts "Do you #{libs[:verb]} your #{libs[:adjective]} #{libs[:noun]} #{libs[:adverb]}? That's hilarious!"
