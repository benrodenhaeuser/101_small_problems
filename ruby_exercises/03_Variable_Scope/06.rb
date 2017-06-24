a = 7

def my_value(b)
  b = a + a # we have never defined a in this scope! 
end

my_value(a)
puts a # => error
