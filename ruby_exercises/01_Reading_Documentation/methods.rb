def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# What will this code print?
# Best guess: we will get an error (wrong number of arguments)
# If that's not true, then most likely [4, 5, 6].
