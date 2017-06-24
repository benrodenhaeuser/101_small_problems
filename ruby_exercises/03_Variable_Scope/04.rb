a = "Xyzzy"

def my_value(b)
  b[2] = '-' # this mutates the string b points to! a points to the same string!
end

my_value(a)
puts a # => "Xy-zy"
