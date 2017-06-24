names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  print names.shift + " "
  break if names == [] # or: break if names.empty?
end

puts

# now in reverse order

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  print names.pop + " "
  break if names == [] # or: break if names.empty?
end

puts
