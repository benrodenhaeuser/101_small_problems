# Array#bsearch

a = [1, 4, 8, 11, 15, 19]

# use Array#bsearch to find the first element >10
elem = a.bsearch { |x| x > 10 }

puts elem
